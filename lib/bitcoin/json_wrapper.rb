require 'net/http'
require 'addressable/uri'
require 'json'

module Bitcoin
  class JsonError < StandardError; end

  class JsonWrapper
    attr_reader :address, :username, :password

    def initialize(url, username, password)
      @address = Addressable::URI.parse(url)
      @username = username
      @password = password
    end

    def request(params)      
      Net::HTTP.start(address.host, address.port) do |connection|
        post = Net::HTTP::Post.new(address.path)
        post.body = request_body
        post.basic_auth(username, password)
        result = connection.request(post)
        result = JSON.parse(result.body)
      end

      if error = result["error"]
        raise Bitcoin::JsonError, "#{error["message"]}, request was #{request_body}"
      end

      result["result"]
    end

    protected

    def request_body
      full(params).to_json
    end
      
    def full params
      params.merge(:jsonrpc => "2.0", :id => id)
    end

    def id
      (rand * 10 ** 12).to_i.to_s
    end

  end
end
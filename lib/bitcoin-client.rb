require 'bitcoin/util'
require 'bitcoin/json_wrapper'

require 'bitcoin/rails' if defined?(::Rails)

module Bitcoin
  class Client
    attr_reader :client

    def initialize config = {}
      config ||= config_loader.load
      @client = Bitcoin::JsonWrapper.new config[:url], config[:username], config[:password]
    end

    def method_missing(method, *args)
      meth = method.to_s.gsub(/\_/, ""),
      client.request(:method => meth, :params => args)
    end

    protected

    def config_loader
      defined?(::Rails) ? Bitcoin::Rails::ConfigLoader.new : Bitcoin::ConfigLoader.new
    end
  end
end
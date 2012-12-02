module Bitcoin
  class ServiceUrl
    attr_reader :user, :password

    def initialize options = {}
      @port = options[:port] if options[:port]
      @user = options[:user] if options[:user]
      @password = options[:password] if options[:password]
      @ip_address = options[:ip_address] if options[:ip_address]
    end

    # modify url as needed!
    # insert your username and password
    def auth
      "http://#{user}:#{password}@:#{ip_address}:#{port}"
    end

    def port
      @port || 8332
    end

    def ip_address
      @ip_address || '127.0.0.1'
    end
  end
end
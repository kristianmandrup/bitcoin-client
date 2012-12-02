module Bitcoin
  module Util
    def bitcoin_client= client
      unless client.kind_of?(Bitcoin::Client)
        raise ArgumentError, "Not a Bitcoin::Client - #{client}"
      end
      @bitcoin_client = client 
    end

    def bitcoin_client
      @bitcoin_client ||= Bitcoin::Client.new
    end

    def valid_bitcoin_address?(address)
      # We don't want leading/trailing spaces to pollute addresses
      (address == address.strip) and bitcoin_client.validate_address(address)['isvalid']
    end

    def my_bitcoin_address?(address)
      bitcoin_client.validate_address(address)['ismine']
    end

    def get_account(address)
      bitcoin_client.get_account(address)
    end

    extend self
  end
end

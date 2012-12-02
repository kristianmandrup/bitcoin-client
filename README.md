# bitcoin-client

Bitcoin Client for use with Rails

Code initially taken https://bitcointalk.org/?topic=2435.0 and https://en.bitcoin.it/wiki/API_reference_%28JSON-RPC%29#Ruby

Then refactored and reworked.

## Install

In Gemfile

`gem 'bitcoin-client'`

Bundle the gem in your project!

`$ bundle`

## Content

* Bitcoin::Client
* Bitcoin::Util
* Bitcoin::Rpc
* Bitcoin::JsonWrapper
* Bitcoin::ConfigLoader
* BitCoin::ServiceUrl

### For Rails 3+

* Bitcoin::Rails::ConfigLoader
* BitcoinAddressValidator

## Usage

Include the `Bitcoin::Util` module into a class or module where you want to use bitcoin.

```ruby
class MyBitCoinClass
  include Bitcoin::Util

  def use_bitcoin address
    if valid_bitcoin_address? address
      # do stuff
    elsif my_bitcoin_address? address
      # do other stuff
    end

    # :)
    get_account address
  end
end
```

Or use the `Bitcoin::Util` module method directly as class methods.

`Bitcoin::Util.valid_bitcoin_address?(address)`

For more API access, add the `bitcoin_client` or `rpc_client`.

```ruby
class MyBitCoinClass
  include Bitcoin::Util

  def bitcoin_client
    Bitcoin::Client.new bitcoin_config
  end

  def bitcoin_rpc
    Bitcoin::Rpc.new service_url
  end

  # See API 
  # https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_Calls_list
  # https://en.bitcoin.it/wiki/API_reference_(JSON-RPC)
  def exec
    bitcoin_client.getbalance
    bitcoin_client.getinfo
    bitcoin_client.getnewaddress
  end

  protected

  # modify url as needed!
  # insert your username and password
  def service_url
    BitCoin::ServiceUrl.new(service_options).auth
  end
end
```

Please help improve this gem ;)

## Contributing to bitcoin-client
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

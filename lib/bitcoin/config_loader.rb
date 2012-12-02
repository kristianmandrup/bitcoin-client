module Bitcoin
  class ConfigLoader
    attr_reader :root, :env, :config_path

    def initialize config_path = nil, options = {}
      @root = options[:root] || ''
      @env  = options[:env]
      config_path ||= File.join root, "config", "bitcoin.yml"
      @config_path = config_path
    end

    # symbolize keys
    # See http://stackoverflow.com/questions/800122/best-way-to-convert-strings-to-symbols-in-hash
    def load
      Hash[hash.map{|(k,v)| [k.to_sym,v]}]
    end

    protected

    def hash
      env ? yaml[env] : yaml
    end

    def yaml
      YAML::load(config_file)
    end

    def config_file
      File.open config_path
    end
  end
end

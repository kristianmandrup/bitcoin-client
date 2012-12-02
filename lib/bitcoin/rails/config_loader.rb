module Bitcoin
  module Rails
    class ConfigLoader
      attr_reader :config_path, :env

      def initialize config_path = nil, options = {}
        @env  = options[:env] || Rails.env
        config_path ||= File.join Rails.root, "config", "bitcoin.yml"
        @config_path = config_path
      end

      def load
        config = yaml[env].symbolize_keys
      end

      protected

      def yaml
        YAML::load(config_file)
      end

      def config_file
        File.open config_path
      end      
    end
  end
end
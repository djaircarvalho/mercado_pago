require 'yaml'

module MercadoPago
  class Configuration
    DEFAULT_CONFIG_FILE_PATH = 'config/mercado_pago.yml'.freeze
    attr_writer :config_file_path


    def access_token
      config['access_token']
    end

    def application_id
      config['application_id']
    end

    def config_file_path
      @config_file_path || DEFAULT_CONFIG_FILE_PATH
    end

    def environment
      @environment ||= ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'test'
    end

    private

    def config
      @config ||= YAML.load(ERB.new(File.read(config_file_path)).result)[environment]
    end
    
  end
end
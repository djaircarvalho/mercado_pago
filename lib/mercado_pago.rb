require 'virtus'
require 'entities'
require 'mercado_pago/configuration'

module MercadoPago
  class << self
    attr_accessor :configuration
    
    def configure
      self.configuration ||= Configuration.new
      yield configuration if block_given?
      configuration
    end

  end
end

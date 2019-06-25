require 'virtus'
require 'mercado_pago/version'
require 'mercado_pago/configuration'
require 'mercado_pago/entities'
require 'mercado_pago/actions'

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

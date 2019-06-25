require 'virtus'
require 'entities'
require 'mercado_pago/configuration'
require 'mercado_pago/base_action'
require 'mercado_pago/create_advanced_payment'
require 'mercado_pago/search_advanced_payment'

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

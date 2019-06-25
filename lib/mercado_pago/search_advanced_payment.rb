require 'blanket'
require 'ostruct'

module MercadoPago
  class SearchAdvancedPayment

    def initialize(payment_id)
      self.payment_id = payment_id
      self.rest_client = Blanket.wrap("https://api.mercadopago.com/v1/", params: {access_token: MercadoPago.configuration.access_token}, headers: {'Content-Type' =>'application/json'})
    end
    
    def run
      perform
      OpenStruct.new(success?: !has_errors?, advanced_payment: advanced_payment, errors: errors)
    end

    private

    def perform
      self.advanced_payment = AdvancedPayment.new(rest_client.advanced_payments.get(payment_id))
    rescue Blanket::Exception => e
      errors << e.message
    end

    def has_errors?
      errors.size > 0
    end

    def errors
      @errors ||= []
    end

    attr_accessor :advanced_payment, :rest_client, :payment_id
  end
end
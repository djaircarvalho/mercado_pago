require 'blanket'
require 'ostruct'

module MercadoPago
  class CreateAdvancedPayment
    def initialize(advanced_payment)
      self.advanced_payment = advanced_payment
      self.rest_client = Blanket.wrap("https://api.mercadopago.com/v1/", params: {access_token: MercadoPago.configuration.access_token}, headers: {'Content-Type' =>'application/json'})
    end

    def run
      perform
      OpenStruct.new(success?: !has_errors?, advanced_payment: created_payment, errors: errors)
    end

    private

    def perform
      self.created_payment = AdvancedPayment.new(rest_client.advanced_payments.post(body: body))
    rescue Blanket::Exception => e
      errors << e.message
    end

    def has_errors?
      errors.size > 0
    end

    def errors
      @errors ||= []
    end

    def body
      advanced_payment.to_hash.to_json
    end

    attr_accessor :advanced_payment, :rest_client, :created_payment
  end
end
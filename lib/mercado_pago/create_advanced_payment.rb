require 'blanket'
require 'ostruct'

module MercadoPago
  class CreateAdvancedPayment < MercadoPago::BaseAction
    def initialize(advanced_payment)
      super()
      self.advanced_payment = advanced_payment
    end

    private

    def perform_action
      rest_client.advanced_payments.post(body: body)
    end

    def body
      advanced_payment.to_hash.to_json
    end

    attr_accessor :advanced_payment
  end
end
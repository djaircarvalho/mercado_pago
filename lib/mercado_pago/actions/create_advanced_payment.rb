module MercadoPago
  class CreateAdvancedPayment < MercadoPago::BaseAction
    SUCCESS_STATES = %w(pending approved in_process).freeze

    def initialize(advanced_payment, access_token = nil)
      super(access_token)
      self.advanced_payment = advanced_payment
    end

    private

    def perform_action
      rest_client.advanced_payments.post(body: body)
    end

    def body
      advanced_payment.to_hash.to_json
    end

    def validate_payment_status
      errors << "#{result_payment.status}: #{result_payment.payments[0].status_detail}" unless SUCCESS_STATES.include?(result_payment.status)
    end

    attr_accessor :advanced_payment
  end
end
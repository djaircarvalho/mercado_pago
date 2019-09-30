module MercadoPago
  class RefundAdvancedPayment < MercadoPago::BaseAction
    @searchAdvancedPayment

    def initialize(payment_id, access_token = nil)
      super(access_token)
      self.payment_id = payment_id
      @searchAdvancedPayment = SearchAdvancedPayment.new(payment_id, access_token)
    end

    private

    def perform_action
      rest_client.advanced_payments(payment_id).refunds.post
      find_payment
    end

    def find_payment
      @searchAdvancedPayment.run.advanced_payment
    end

    attr_accessor :payment_id
  end
end
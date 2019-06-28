module MercadoPago
  class RefundAdvancedPaymentDisbursement < MercadoPago::BaseAction

    def initialize(payment_id, disbursement_id)
      super()
      self.payment_id = payment_id
      self.disbursement_id = disbursement_id
    end

    private

    def perform_action
      rest_client.advanced_payments(payment_id).disbursements(disbursement_id).refunds.post
      find_payment
    end

    def find_payment
      SearchAdvancedPayment.new(payment_id).run.advanced_payment
    end

    attr_accessor :payment_id, :disbursement_id
  end
end
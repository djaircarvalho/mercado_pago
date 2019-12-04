module MercadoPago
  class SearchAdvancedPayment < MercadoPago::BaseAction

    def initialize(payment_id, access_token = nil)
      super(access_token)
      self.payment_id = payment_id
    end

    private

    def perform_action
      rest_client.advanced_payments.get(payment_id)
    end

    attr_accessor :payment_id
  end
end
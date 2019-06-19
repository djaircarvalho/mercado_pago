module MercadoPago
  class AdvancedPayment
    include Virtus.model

    attribute :id, Integer
    attribute  :application_id, String
    attribute  :notification_url, String
    attribute :payer, Payer
    attribute :payments, Array[PaymentInfo]
    attribute :disbursements, Array[Disbursement]
    attribute :binary_mode, Boolean, :default => false
  end
end
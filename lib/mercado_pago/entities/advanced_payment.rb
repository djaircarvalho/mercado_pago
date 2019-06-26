module MercadoPago
  class AdvancedPayment < MercadoPago::Base

    attribute :id, Integer
    attribute :status, String
    attribute :application_id, String
    attribute :notification_url, String
    attribute :payer, Payer
    attribute :payments, Array[PaymentInfo]
    attribute :disbursements, Array[Disbursement]
    attribute :capture, Boolean
    attribute :binary_mode, Boolean, :default => false
  end
end
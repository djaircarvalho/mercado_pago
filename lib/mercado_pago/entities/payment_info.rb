module MercadoPago
  class PaymentInfo < MercadoPago::Base

    attribute :id, Integer
    attribute :status, String
    attribute :status_detail, String
    attribute :payment_type_id, String
    attribute :payment_method_id, String
    attribute :token, String
    attribute :transaction_amount, Float
    attribute :installments, Integer
    attribute :processing_mode, String
    attribute :issuer_id, String
    attribute :description, String
    attribute :capture, Boolean
    attribute :external_reference, String
    attribute :statement_descriptor, String
    attribute :date_of_expiration, String

  end
end
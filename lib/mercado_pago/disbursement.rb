module MercadoPago
  class Disbursement
    include Virtus.model

    attribute :id, Integer
    attribute :amount, Float
    attribute :external_reference, String
    attribute :collector_id, Integer
    attribute :application_fee, Float
    attribute :money_release_days, Float
    attribute :items, Array[Item]
  end
end
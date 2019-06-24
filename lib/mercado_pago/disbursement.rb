require_relative 'disbursement/additional_info'

module MercadoPago
  class Disbursement < MercadoPago::Base

    attribute :id, Integer
    attribute :amount, Float
    attribute :external_reference, String
    attribute :collector_id, Integer
    attribute :application_fee, Float
    attribute :money_release_days, Float
    attribute :additional_info, AdditionalInfo
    
  end
end
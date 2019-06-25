module MercadoPago
  class Payer < MercadoPago::Base
    
    attribute :id, String
    attribute :email, String
    attribute :type, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :identification, Identification
  end
end
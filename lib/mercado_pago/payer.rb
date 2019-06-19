module MercadoPago
  class Payer
    include Virtus.model
    attribute :id, String
    attribute :email, String
    attribute :type, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :identification, Identification
  end
end
module MercadoPago
  class Address
    include Virtus.model

    attribute :zip_code, String
    attribute :street_name, String
    attribute :street_number, Integer
  end
end
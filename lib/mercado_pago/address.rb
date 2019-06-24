module MercadoPago
  class Address < MercadoPago::Base

    attribute :zip_code, String
    attribute :street_name, String
    attribute :street_number, Integer
  end
end
module MercadoPago
  class Identification < MercadoPago::Base

    attribute :type, String
    attribute :number, String
  end
end
module MercadoPago
  class Identification
    include Virtus.model

    attribute :type, String
    attribute :number, String
  end
end
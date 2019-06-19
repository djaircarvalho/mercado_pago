module MercadoPago
  class Phone
    include Virtus.model

    attribute :area_code, String
    attribute :number, String
    attribute :extension, String
  end
end
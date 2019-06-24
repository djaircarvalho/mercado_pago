module MercadoPago
  class Phone < MercadoPago::Base

    attribute :area_code, String
    attribute :number, String
    attribute :extension, String
  end
end
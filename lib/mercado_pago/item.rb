module MercadoPago
  class Item < MercadoPago::Base
    
    attribute :id, String
    attribute :title, String
    attribute :description, String
    attribute :picture_url, String
    attribute :category_id, String
    attribute :quantity, Integer
    attribute :unit_price, Float

  end
end
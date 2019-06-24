require 'virtus_convert'
module MercadoPago
  class Base
    include Virtus.model
    
    def to_hash
      VirtusConvert.new(self, reject_nils: true).to_hash
    end
  end
end
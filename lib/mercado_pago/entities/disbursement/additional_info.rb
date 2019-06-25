module MercadoPago
  class Disbursement < MercadoPago::Base
    class AdditionalInfo < MercadoPago::Base

      attribute :items, Array[Item]    
    end
  end
end
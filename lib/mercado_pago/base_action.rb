module MercadoPago
  class BaseAction

    def initialize
      self.rest_client = Blanket.wrap("https://api.mercadopago.com/v1/", params: {access_token: MercadoPago.configuration.access_token}, headers: {'Content-Type' =>'application/json'})
    end

    def run
      perform
      OpenStruct.new(success?: !has_errors?, advanced_payment: result_payment, errors: errors)
    end

    private
    
    def perform
      self.result_payment = AdvancedPayment.new(perform_action)
    rescue Blanket::Exception => e
      errors << e.message
    end

    def perform_action
      nil
    end

    def has_errors?
      errors.size > 0
    end

    def errors
      @errors ||= []
    end

    attr_accessor :result_payment, :rest_client
  end
end
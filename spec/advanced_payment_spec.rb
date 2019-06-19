require 'spec_helper'

RSpec.describe MercadoPago::AdvancedPayment do
  context "pass all attributes" do
    let(:params) do
      {
        "id" => 21312312313123,
        "application_id" => "application_id",
        "notification_url" => "https://9af20ad2.ngrok.io/inbound",
        "payments" => [{
          "id" => 4876404328,
          "status" => "pending",
          "status_detail" => "pending_waiting_payment",
          "payment_type_id" => "ticket",
          "payment_method_id" => "bolbradesco",
          "token" => 'token',
          "transaction_amount" => 130.5,
          "installments" => 1,
          "processing_mode" => "aggregator",
          "issuer_id" => "issuer",
          "description" => "Service charge",
          "capture" => false,
          "external_reference" => "extPayment",
          "statement_descriptor" => "WWW.MktSplitterMLBTEST.COM.BR",
          "date_of_expiration" => "2019-06-30T21:52:49.000-04:00"
        }],
        "payer" => {
          "id" => "123456",
          "email" => "test_user_p@testuser.com",
          "first_name"=> "John",
          "last_name"=> "Doe",
          "type" => "customer",
          "identification"=> {
            "type"=> "CPF",
            "number"=> "72495586090"
          }
        },
        "disbursements" => [{
          "id" => 88056321,
          "amount"=> 12.21,
          "external_reference" => 'id-123',
          "collector_id" => 123456,
          "application_fee" => 1.2,
          "money_release_days" => 20
        }]
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns id' do
      expect(subject.id).to eq(21312312313123)
    end

    it 'assigns application_id' do
      expect(subject.application_id).to eq('application_id')
    end
    
    it 'assigns notification_url' do
      expect(subject.notification_url).to eq('https://9af20ad2.ngrok.io/inbound')
    end

    it 'assigns payments' do
      expect(subject.payments.size).to eq(1)
    end

    it 'assigns payments.id' do
      expect(subject.payments[0].id).to eq(4876404328)
    end
    
    it 'assigns payments.status' do
      expect(subject.payments[0].status).to eq('pending')
    end

    it 'assigns payments.status_detail' do
      expect(subject.payments[0].status_detail).to eq('pending_waiting_payment')
    end

    it 'assigns payments.payment_type_id' do
      expect(subject.payments[0].payment_type_id).to eq('ticket')
    end

    it 'assigns payments.payment_method_id' do
      expect(subject.payments[0].payment_method_id).to eq('bolbradesco')
    end
    
    it 'assigns payments.token' do
      expect(subject.payments[0].token).to eq('token')
    end

    it 'assigns payments.transaction_amount' do
      expect(subject.payments[0].transaction_amount).to eq(130.5)
    end

    it 'assigns payments.installments' do
      expect(subject.payments[0].installments).to eq(1)
    end

    it 'assigns payments.processing_mode' do
      expect(subject.payments[0].processing_mode).to eq('aggregator')
    end

    it 'assigns payments.issuer_id' do
      expect(subject.payments[0].issuer_id).to eq('issuer')
    end

    it 'assigns payments.description' do
      expect(subject.payments[0].description).to eq('Service charge')
    end

    it 'assigns payments.capture' do
      expect(subject.payments[0].capture).to eq(false)
    end

    it 'assigns payments.external_reference' do
      expect(subject.payments[0].external_reference).to eq('extPayment')
    end

    it 'assigns payments.statement_descriptor' do
      expect(subject.payments[0].statement_descriptor).to eq('WWW.MktSplitterMLBTEST.COM.BR')
    end

    it 'assigns payments.date_of_expiration' do
      expect(subject.payments[0].date_of_expiration).to eq('2019-06-30T21:52:49.000-04:00')
    end

  end
end

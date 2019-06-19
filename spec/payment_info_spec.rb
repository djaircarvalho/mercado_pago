require 'spec_helper'

RSpec.describe MercadoPago::PaymentInfo do

  let(:params) do
    {
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
    }
  end 

  let(:subject) { described_class.new(params) }

    it 'assigns id' do
      expect(subject.id).to eq(4876404328)
    end
    
    it 'assigns status' do
      expect(subject.status).to eq('pending')
    end

    it 'assigns status_detail' do
      expect(subject.status_detail).to eq('pending_waiting_payment')
    end

    it 'assigns payment_type_id' do
      expect(subject.payment_type_id).to eq('ticket')
    end

    it 'assigns payment_method_id' do
      expect(subject.payment_method_id).to eq('bolbradesco')
    end

    it 'assigns token' do
      expect(subject.token).to eq('token')
    end

    it 'assigns transaction_amount' do
      expect(subject.transaction_amount).to eq(130.5)
    end

    it 'assigns installments' do
      expect(subject.installments).to eq(1)
    end

    it 'assigns processing_mode' do
      expect(subject.processing_mode).to eq('aggregator')
    end

    it 'assigns issuer_id' do
      expect(subject.issuer_id).to eq('issuer')
    end

    it 'assigns description' do
      expect(subject.description).to eq('Service charge')
    end

    it 'assigns capture' do
      expect(subject.capture).to eq(false)
    end

    it 'assigns external_reference' do
      expect(subject.external_reference).to eq('extPayment')
    end
    
    it 'assigns statement_descriptor' do
      expect(subject.statement_descriptor).to eq('WWW.MktSplitterMLBTEST.COM.BR')
    end

    it 'assigns date_of_expiration' do
      expect(subject.date_of_expiration).to eq('2019-06-30T21:52:49.000-04:00')
    end
  
end

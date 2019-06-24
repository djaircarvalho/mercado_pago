require 'spec_helper'

RSpec.describe MercadoPago::CreateAdvancedPayment, :vcr do
  let(:access_token) { 'APP_USR-4401258639222046-052215-93e61747e6f50210577e169b695cd277-438050834' }

  before do
    allow(MercadoPago).to receive(:configuration).and_return(double(access_token: access_token))
  end

  let(:file_path) { 'spec/fixtures/payment_configs/ticket_payment.json' }
  let(:advanced_payment) do
    MercadoPago::AdvancedPayment.new(JSON.parse(File.read(file_path)))
  end

  let(:subject) { described_class.new(advanced_payment).run }
  
  describe 'run' do
    context 'valid ticket' do
      it 'returns success? true' do
        is_expected.to  be_success
      end

      it 'assigns id' do
        expect(subject.advanced_payment.id).to eq(61690229)
      end
  
      it 'assigns application_id' do
        expect(subject.advanced_payment.application_id).to eq('4401258639222046')
      end
      
      it 'assigns notification_url' do
        expect(subject.advanced_payment.notification_url).to eq('https://9af20ad2.ngrok.io/inbound')
      end
  
      it 'assigns payments' do
        expect(subject.advanced_payment.payments.size).to eq(1)
      end
  
      it 'assigns payments.id' do
        expect(subject.advanced_payment.payments[0].id).to eq(4897938934)
      end
      
      it 'assigns payments.status' do
        expect(subject.advanced_payment.payments[0].status).to eq('pending')
      end
  
      it 'assigns payments.status_detail' do
        expect(subject.advanced_payment.payments[0].status_detail).to eq('pending_waiting_payment')
      end
  
      it 'assigns payments.payment_type_id' do
        expect(subject.advanced_payment.payments[0].payment_type_id).to eq('ticket')
      end
  
      it 'assigns payments.payment_method_id' do
        expect(subject.advanced_payment.payments[0].payment_method_id).to eq('bolbradesco')
      end
      
  
      it 'assigns payments.transaction_amount' do
        expect(subject.advanced_payment.payments[0].transaction_amount).to eq(130)
      end
  
      it 'assigns payments.installments' do
        expect(subject.advanced_payment.payments[0].installments).to eq(1)
      end
  
      it 'assigns payments.processing_mode' do
        expect(subject.advanced_payment.payments[0].processing_mode).to eq('aggregator')
      end
  
  
      it 'assigns payments.description' do
        expect(subject.advanced_payment.payments[0].description).to eq('Service charge')
      end
  
      it 'assigns payments.external_reference' do
        expect(subject.advanced_payment.payments[0].external_reference).to eq('extPayment')
      end
  
      it 'assigns payments.statement_descriptor' do
        expect(subject.advanced_payment.payments[0].statement_descriptor).to eq('WWW.MktSplitterMLBTEST.COM.BR')
      end
  
      it 'assigns payments.date_of_expiration' do
        expect(subject.advanced_payment.payments[0].date_of_expiration).to eq('2019-06-30T21:52:49.000-04:00')
      end
  
      it 'assigns disbursements' do
        expect(subject.advanced_payment.disbursements.size).to eq(1)
      end
  
      it 'assigns disbursements.amount' do
        expect(subject.advanced_payment.disbursements[0].amount).to eq(130)
      end
  
      it 'assigns disbursements.external_reference' do
        expect(subject.advanced_payment.disbursements[0].external_reference).to eq('ext1')
      end
  
      it 'assigns disbursements.collector_id' do
        expect(subject.advanced_payment.disbursements[0].collector_id).to eq(438055858)
      end
  
      it 'assigns disbursements.application_fee"' do
        expect(subject.advanced_payment.disbursements[0].application_fee).to eq(1.0)
      end
  
      it 'assigns disbursements.money_release_days"' do
        expect(subject.advanced_payment.disbursements[0].money_release_days).to eq(30)
      end
  
      it 'assigns binary_mode default true"' do
        expect(subject.advanced_payment.binary_mode).to eq(true)
      end
    end

    context 'token invalid' do
      let(:access_token) { 'APP_USR-INVALID' }
      
      it 'returns success? false' do
        is_expected.not_to  be_success
      end

      it 'assigns errors' do
        expect(subject.errors).to eq(['401 Unauthorized'])
      end
    end

    context 'amount diffrent from disbursement' do
      before do
        advanced_payment.payments[0].transaction_amount = 130.1
      end
      it 'returns success? false' do
        is_expected.not_to  be_success
      end

      it 'assigns errors' do
        expect(subject.errors).to eq(['400 Bad Request'])
      end
    end
  end
end

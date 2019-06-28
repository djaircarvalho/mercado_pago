require 'spec_helper'

RSpec.describe MercadoPago::RefundAdvancedPaymentDisbursement, :vcr do
  let(:access_token) { 'APP_USR-4401258639222046-052215-93e61747e6f50210577e169b695cd277-438050834' }
  let(:payment_id) { 61846355 }
  let(:disbursement_id) { 4866496363 }

    before do
      allow(MercadoPago).to receive(:configuration).and_return(double(access_token: access_token))
    end

    let(:subject) { described_class.new(payment_id, disbursement_id) }
  
    describe '#run' do
      context 'approved payment' do
        it 'returns success? true' do
          response = subject.run
          expect(response).to  be_success
        end
      end

      context 'pending payment' do
        let(:payment_id) { 61737150 }
        it 'returns success? false' do
          response = subject.run
          expect(response).not_to  be_success
          expect(response.errors).to eq(["400 Bad Request"])
        end
      end

      context 'refunded payment' do
        it 'returns success? false' do
          response = subject.run
          expect(response).not_to  be_success
          expect(response.errors).to eq(["400 Bad Request"])
        end
      end
  end
end

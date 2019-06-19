require 'spec_helper'

RSpec.describe MercadoPago::Address do
  context "pass all attributes" do
    let(:params) do
      {
        "zip_code" => "88056321",
        "street_name"=> "No Street",
        "street_number" => 12
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns zip_code' do
      expect(subject.zip_code).to eq('88056321')
    end
    
    it 'assigns street_name' do
      expect(subject.street_name).to eq('No Street')
    end

    it 'assigns street_number' do
      expect(subject.street_number).to eq(12)
    end
  end
end

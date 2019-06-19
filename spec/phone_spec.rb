require 'spec_helper'

RSpec.describe MercadoPago::Phone do
  context "pass all attributes" do
    let(:params) do
      {
        "area_code" => "48",
        "number"=> "888654987",
        "extension" => "123456"
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns area_code' do
      expect(subject.area_code).to eq('48')
    end
    
    it 'assigns number' do
      expect(subject.number).to eq('888654987')
    end

    it 'assigns extension' do
      expect(subject.extension).to eq('123456')
    end
  end
end

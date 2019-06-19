require 'spec_helper'

RSpec.describe MercadoPago::Identification do
  context "pass all attributes" do
    let(:params) do
      {
        "type" => "CPF",
        "number"=> "7945632158"
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns type' do
      expect(subject.type).to eq('CPF')
    end
    
    it 'assigns number' do
      expect(subject.number).to eq('7945632158')
    end
  end
end

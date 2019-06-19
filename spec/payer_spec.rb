require 'spec_helper'

RSpec.describe MercadoPago::Payer do
  context "pass all attributes" do
    let(:params) do
      {
        "id" => "123456",
        "email" => "test_user_p@testuser.com",
        "first_name"=> "John",
        "last_name"=> "Doe",
        "type" => "customer",
        "identification"=> {
          "type"=> "CPF",
          "number"=> "72495586090"
        }
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns email' do
      expect(subject.email).to eq('test_user_p@testuser.com')
    end
    
    it 'assigns first_name' do
      expect(subject.first_name).to eq('John')
    end

    it 'assigns last_name' do
      expect(subject.last_name).to eq('Doe')
    end

    it 'assigns identification' do
      expect(subject.identification.type).to eq('CPF')
      expect(subject.identification.number).to eq('72495586090')
    end

    it 'assigns id' do
      expect(subject.id).to eq("123456")
    end
    
    it 'assigns type' do
      expect(subject.type).to eq("customer")
    end
  end
end

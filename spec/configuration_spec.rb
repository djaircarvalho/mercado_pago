require 'spec_helper'

RSpec.describe MercadoPago::Configuration do
  context 'defaults' do
    describe 'sets default' do
      it 'environment to test' do
        expect(subject.environment).to eq('test')
      end

      it 'config_file_path to config/mercado_pago.yml' do
        expect(subject.config_file_path).to eq('config/mercado_pago.yml')
      end
    end
  end

  context 'envirmonments' do
    ['RACK_ENV', 'RAILS_ENV'].each do |env_var|
      let(:subject) { described_class.new.tap {|config| config.config_file_path = 'spec/fixtures/config.yml'} }
      context env_var do
        ['production', 'test'].each do |environment|
          describe environment do
            before do
              allow(ENV).to receive(:[]).and_return(nil)
              allow(ENV).to receive(:[]).with(env_var).and_return(environment)
            end

            it "sets environment to #{environment}" do
              expect(subject.environment).to eq(environment)
            end      
            it 'sets access_token' do
              expect(subject.access_token).to eq("access_token_#{environment}")
            end
            it 'sets application_id' do
              expect(subject.application_id).to eq("application_id_#{environment}")
            end
          end
        end
      end
    end
  end
  
end

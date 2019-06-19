RSpec.describe MercadoPago do
  it "has a version number" do
    expect(MercadoPago::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'returns a configuration' do
      expect(MercadoPago.configure).to be_a(MercadoPago::Configuration)
    end
  end
end

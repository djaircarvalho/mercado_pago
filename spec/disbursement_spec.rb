require 'spec_helper'

RSpec.describe MercadoPago::Disbursement do
  context "pass all attributes" do
    let(:params) do
      {
        "id" => 88056321,
        "amount"=> 12.21,
        "external_reference" => 'id-123',
        "collector_id" => 123456,
        "application_fee" => 1.2,
        "money_release_days" => 20,
        "items" => [
          {
              "id" => "item-ID-1234",
              "title" => "Title of the item",
              "description" => "Item description",
              "picture_url" => "https://some_image.jpg",
              "category_id" => "art",
              "quantity" => 1,
              "unit_price" => 12.21
          }
        ]
      }
    end

    let(:subject) { described_class.new(params) }

    it 'assigns id' do
      expect(subject.id).to eq(88056321)
    end
    
    it 'assigns amount' do
      expect(subject.amount).to eq(12.21)
    end

    it 'assigns external_reference' do
      expect(subject.external_reference).to eq('id-123')
    end

    it 'assigns collector_id' do
      expect(subject.collector_id).to eq(123456)
    end

    it 'assigns application_fee' do
      expect(subject.application_fee).to eq(1.2)
    end

    it 'assigns money_release_days' do
      expect(subject.money_release_days).to eq(20)
    end

    it 'assigns items' do
      expect(subject.items.size).to eq(1)
    end
    
    it 'assigns items.id' do
      expect(subject.items[0].id).to eq('item-ID-1234')
    end
    
    it 'assigns items.title' do
      expect(subject.items[0].title).to eq('Title of the item')
    end
    
    it 'assigns items.description' do
      expect(subject.items[0].description).to eq('Item description')
    end
    
    it 'assigns items.picture_url' do
      expect(subject.items[0].picture_url).to eq('https://some_image.jpg')
    end
    
    it 'assigns items.category_id' do
      expect(subject.items[0].category_id).to eq('art')
    end
    
    it 'assigns items.quantity' do
      expect(subject.items[0].quantity).to eq(1)
    end
    
    it 'assigns items.unit_price' do
      expect(subject.items[0].unit_price).to eq(12.21)
    end
  end
end


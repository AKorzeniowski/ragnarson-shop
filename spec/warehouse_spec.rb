require './lib/product.rb'
require './lib/storage.rb'
require './lib/warehouse.rb'

RSpec.describe Warehouse do 
  subject (:warehouse) { 
    Product.class_variable_set :@@last_id, 0
    products = [Product.new("Milk", 2, 23), Product.new("Book", 10, 8), Product.new("Gems", 100, 23)]
    Warehouse.new("Test", products)
  } 

  context :params do
    it 'requires a name' do 
      expect{Warehouse.new(nil)}.to raise_error ArgumentError
    end
  end

  context :name do
    it 'should properly return the name' do
      expect(subject.name).to eq("Test")
    end
  end

  context :get_product do
    it 'should return a product' do
      expect(subject.get_product(1)).to be_a Product
    end
    it 'should return a product with a given id' do
      expect(subject.get_product(1).id).to eq(1)
    end
    it 'should raise ProductNotFound when such product doesn\'t exist' do
      expect{subject.get_product(4)}.to raise_error ArgumentError
    end
  end


end
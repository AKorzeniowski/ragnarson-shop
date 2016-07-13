require './lib/modules/product.rb'

RSpec.describe Store::Product do 
  let(:name) { 'foo' }
  let(:price) { 1 }
  let(:vat) { 23 }

  subject(:product) { Store::Product.new(name, price, vat) }

  describe :new do
    context :params do
      it 'needs to accept three parameters' do
        expect{product}.to_not raise_error
      end
    
      it 'requires only two parameters' do
        expect{Store::Product.new('foo', 1)}.to_not raise_error
      end
  
      it 'cannot accept less than two parameters' do
        expect{Store::Product.new('foo')}.to raise_error ArgumentError
      end
    end

    context :name do 
      it 'needs to get something as a name' do
        expect{Store::Product.new(nil, 1)}.to raise_error ArgumentError
      end
    
      it 'can only accept text as name' do
        expect{Store::Product.new(1, 1)}.to raise_error TypeError
      end
    end

    context :price do
      it 'needs to get a price' do
        expect{Store::Product.new('foo',nil)}.to raise_error ArgumentError
      end

      it 'can only accept number as a price' do
        expect{Store::Product.new('foo', 'bar')}.to raise_error TypeError
      end
    end

    context :vat do
      it 'should by default set vat to 23' do
        expect(Store::Product.new('foo', 1).vat).to eql(23)
      end

      it 'can only accept number as a vat' do
        expect{Store::Product.new('foo', 1, 'bar')}.to raise_error TypeError
      end
    end
  end

  describe :name do
    it 'should return the correct name' do
      expect(subject.name).to eql(name)
    end
  end

  describe :price do
    it 'should return the correct price' do
      expect(subject.price).to eql(price)
    end
  end

  describe :vat do
    it 'should return the correct vat' do
      expect(subject.vat).to eql(vat)
    end
  end

  describe :price_with_vat do
    it 'should return the correct price with vat' do 
      expect(subject.price_with_vat).to eql(1.23)
    end
  end
end

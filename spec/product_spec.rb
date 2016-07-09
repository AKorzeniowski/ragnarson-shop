require './lib/product.rb'

RSpec.describe Product do 
  let(:first_product) {Product.new('foo', 1, 23)}

  context :params do
    it 'needs to accept three parameters' do
      expect{Product.new('foo', 1, 23)}.to_not raise_error
    end
  
    it 'requires only two parameters' do
      expect{Product.new('foo', 1)}.to_not raise_error
    end

    it 'cannot accept less than two parameters' do
      expect{Product.new('foo')}.to raise_error ArgumentError
    end
  end

  context :name do
    it 'needs to get something as a name' do
      expect{Product.new(nil, 1)}.to raise_error ArgumentError
    end
  
    it 'can only accept text as name' do
      expect{Product.new(1, 1)}.to raise_error TypeError
    end

    it 'should properly return a name' do
      expect(Product.new('foo', 1).name).to eql('foo')
    end
  end

  context :price do
    it 'needs to get a price' do
      expect{Product.new('foo',nil)}.to raise_error ArgumentError
    end

    it 'can only accept number as a price' do
      expect{Product.new('foo', 'bar')}.to raise_error TypeError
    end

    it 'should properly return a price' do
      expect(Product.new('foo', 10).price).to eql(10)
    end
  end

  context :vat do
    it 'can only accept number as vat' do
      expect{Product.new('foo', 1, 'bar')}.to raise_error TypeError
    end

    it 'should properly return the vat' do
      expect(Product.new('foo', 10, 8).vat).to eql(8)
    end

    it 'should by default set vat to 23' do
      expect(Product.new('foo', 1).vat).to eql(23)

    end
  end
end
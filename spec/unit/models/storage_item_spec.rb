require "./lib/modules/product.rb"
require "./lib/modules/storage_item.rb"
require "./lib/services/fetch_product_by_id.rb"

RSpec.describe Store::StorageItem do
  let(:product_id) { 1 }
  let(:quantity) { 1 }

  subject(:storage_item) { Store::StorageItem.new(product_id, quantity) }

  describe "#new" do
    context "for params" do
      it "needs to accept two parameters" do
        expect { storage_item }.to_not raise_error
      end

      it "requires only one parameter" do
        expect { Store::StorageItem.new(1) }.to_not raise_error
      end

      it "cannot accept no parameters" do
        expect { Store::StorageItem.new() }.to raise_error ArgumentError
      end
    end

    context "for product_id" do
      it "needs to get something as product_id" do
        expect { Store::StorageItem.new(nil, 1) }.to raise_error ArgumentError
      end

      it "can only accept numeric values as product_id" do
        expect { Store::StorageItem.new("foo", 1) }.to raise_error TypeError
      end

      it "cannot accept negative values as product_id" do
        expect { Store::StorageItem.new(-1, 1) }.to raise_error TypeError
      end
    end

    context "for quantity" do
      it "needs to get something as quantity" do
        expect { Store::StorageItem.new(1, nil) }.to raise_error ArgumentError
      end

      it "can only accept numeric values as quantity" do
        expect { Store::StorageItem.new(1, "foo") }.to raise_error TypeError
      end

      it "cannot accept negative values as quantity" do
        expect { Store::StorageItem.new(1, -1) }.to raise_error TypeError
      end
    end

    context "for methods" do
      before(:all) do
      PRODUCTS = [ 
        Store::Product.new("foo", 1) 
      ]
      end

      let(:storage_item) { Store::StorageItem.new(1, 1) }

      context "for fetch_product" do
        it "returns a product" do
          expect(storage_item.fetch_product).to be_a Store::Product
        end
  
        it "returns a product with a requested id" do
          expect(storage_item.fetch_product.id).to eql(1)
        end
      end
  
      context "for net_product_price" do  
        it "returns the correct price of product" do
          expect(storage_item.net_product_price).to eql(1)
        end
      end
  
      context "for gross_product_price" do
        it "returns the correct price with vat of product" do
           expect(storage_item.gross_product_price).to eql(1.23)         
        end
      end
    end
  end
end

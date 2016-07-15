require "./lib/modules/product.rb"
require "./lib/modules/storage_item.rb"

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
      it ""
    end
  end
end

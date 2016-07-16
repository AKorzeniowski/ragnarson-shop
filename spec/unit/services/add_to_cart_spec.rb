require "./lib/modules/product.rb"
require "./lib/modules/storage_item.rb"
require "./lib/services/add_to_cart.rb"
require "./lib/services/add_to_warehouse.rb"
require "./lib/services/fetch_product_from_storage.rb"

RSpec.describe Store::AddToCart do
  subject(:add) { Store::AddToCart }

  describe "#new" do
    context "with invalid params" do
      it "raises error for invalid product_id" do
        expect {
          add.new({ "product_id" => "foo", "quantity" => "1" })
        }.to raise_error TypeError
      end

      it "raises error for invalid quantity" do
        expect {
          add.new({ "product_id" => "1", "quantity" => "-42" })
        }.to raise_error TypeError
      end
    end

    context "with valid params" do
      it "doesn't raise an error for valid params" do
        expect {
          add.new({ "product_id" => "1", "quantity" => "1" })
        }.to_not raise_error
      end
    end
  end

  describe "#call" do
    let(:product) { Store::Product.new("foo", 1, 23) }
    let(:params) { {"product_id" => product.id, "quantity" => 1} }

    before(:all) do
      WAREHOUSE = []
      CART = []
    end

    before do
      WAREHOUSE.clear
      Store::AddToWarehouse.new(product.id, 1).call
      p WAREHOUSE
      CART.clear
    end

    it "accepts correct params" do
      expect {
        add.new(params).call
      }.to_not raise_error
    end

    context "product not in warehouse" do

    end

    context "product not in cart" do
      it "adds a product to cart" do
        expect {
          add.new(params).call
        }.to change { CART.size }.by(1)
      end
    end

    context "product already in cart" do
      it "increments quantity of product" do
        add.new("product_id" => product.id, "quantity" => 1).call
        expect {
          add.new(params).call
        }.to change {
          Store::FetchProductFromStorage.new.call(product.id, CART).quantity
        }.by(1)
      end
    end
  end
end

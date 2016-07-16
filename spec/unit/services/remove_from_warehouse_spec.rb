require "./lib/modules/product.rb"
require "./lib/services/add_to_warehouse.rb"
require "./lib/services/remove_from_warehouse.rb"

RSpec.describe Store::RemoveFromWarehouse do
  let(:name) { "foo" }
  let(:price) { 1 }
  let(:vat) { 23 }
  let(:product) { Store::Product.new(name, price, vat) }


  describe "#new" do

  end
end

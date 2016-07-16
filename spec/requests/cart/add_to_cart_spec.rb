require "web_spec"

RSpec.describe "POST /cart", type: :request do
  context "with invalid params" do
    let(:invalid_params) { { test: "meow" } }

    before do
      do_request(invalid_params)
    end

    it "returns 422 as HTTP status code" do
      expect(last_response.status).to eql(422)
    end
  end

  context "with valid params" do
    context "product not in the warehouse" do
      let(:product) { Store::FetchProducts.new.call.first }
      let(:valid_params) { { "product_id" => product.id, "quantity" => "1" } }
  
      before do
        do_request(valid_params)
      end
  
      it "returns 404 as HTTP status code" do
        expect(last_response.status).to eql(404)
      end
  
      it "gives an error page" do
        expect(last_response.body).to include("BŁĄD")
      end
    end
  end

  private

  def do_request(params = {})
    post "/cart/add", params
  end
end

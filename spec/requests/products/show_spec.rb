require "web_spec"

RSpec.describe "GET /products/:id", type: :request do
  context "with a product that doesn't exist" do
    before do
      do_request(100)
    end

    it "returns HTTP code 404" do
      expect(last_response.status).to eql(404)
    end

    it "returns a valid webpage" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
    end
  end

  context "with a product that exists" do
    let(:product) { Store::FetchProducts.new.call.first }

    before do
      do_request(product.id)
    end

    it "returns HTTP code 200" do
      expect(last_response.status).to eql(200)
    end

    it "returns a valid webpage" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
    end

    it "returns the product name" do
      expect(last_response.body).to include("#{product.name}")
    end
  end

  private

  def do_request(id)
    get "/products/#{id}"
  end
end

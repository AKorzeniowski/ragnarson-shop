require "web_spec"

RSpec.describe "GET /", type: :request do
  before do
    do_request
  end

  it "returns HTTP code 200" do
    expect(last_response.status).to eql(200)
  end

  it "returns a valid webpage" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "returns an h1 element" do
    expect(last_response.body).to include("<h1>Awesome shop</h1>")
  end

  it "returns a link to cart" do
    expect(last_response.body).to include('<a href="/cart">Cart</a>')
  end

  it "returns a link to warehouse" do
    expect(last_response.body).to include('<a href="/warehouse">Warehouse</a>')
  end

  it "returns a link to products" do
    expect(last_response.body).to include('<a href="/products">Products</a>')
  end

  private

  def do_request
    get "/"
  end
end

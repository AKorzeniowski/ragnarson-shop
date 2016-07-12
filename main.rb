require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each{|file| require file}

module Store
  PRODUCTS = [
    Product.new("Milk", 2, 23), 
    Product.new("Book", 10, 8), 
    Product.new("Gems", 100, 23)
  ]

  WAREHOUSE = []
  CART = []

  class App < Sinatra::Base
    get "/" do
      erb :index
    end

    get "/products/?" do
      products = FetchProducts.new.call
      erb :products, locals: { products: products }
    end

    get "/products/:id/?" do |id|
      product = FetchProductById.new.call(id)
      erb :product, locals: { product: product }
    end

    get "/cart/?" do
      cart = FetchCart.new.call
      erb :cart, locals: { cart: cart }
    end

    post "/cart/add/?" do
      AddToCart.new(params).call
      p CART
      redirect "/cart"
    end
  end
end
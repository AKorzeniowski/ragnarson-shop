require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each { |file| require file }

module Store
  PRODUCTS = [
    Product.new("Milk", 1, 23),
    Product.new("Book", 10, 8),
    Product.new("Gems", 100, 23)
  ]

  WAREHOUSE = []
  CART = []

  class App < Sinatra::Base
    configure :test, :production do
      set :dump_errors, false
    end

    get "/" do
      erb :index
    end

    get "/products/?" do
      products = FetchProducts.new.call
      erb :products, locals: { products: products }
    end

    get "/products/:id/?" do |id|
      begin
        product = FetchProductById.new.call(id)
        erb :product, locals: { product: product }
      rescue ProductNotFoundError
        status 404
        erb :error, locals: { error: "Nie znaleziono produktu :(" }
      end
    end

    get "/cart/?" do
      cart = FetchCart.new.call
      erb :cart, locals: { cart: cart }
    end

    post "/cart/add/?" do
      begin
        RemoveFromWarehouse.new(params).call
        AddToCart.new(params).call
        redirect "/cart"
      rescue ProductNotFoundError
        status 404
        erb :error, locals: { error: "Nie znaleziono produktu do dodania :(" }
      rescue KeyError
        status 422
        erb :error, locals: { error: "Nieprawidłowe żądanie :(" }
      end
    end

    post "/cart/remove/?" do
      RemoveFromCart.new(params).call
      AddToWarehouse.new(params).call
      redirect "/cart"
    end

    get "/warehouse/?" do
      warehouse = FetchWarehouse.new.call
      erb :warehouse, locals: { warehouse: warehouse }
    end

    post "/warehouse/add/?" do
      AddToWarehouse.new(params).call
      redirect "/warehouse"
    end

    post "/warehouse/remove/?" do
      RemoveFromWarehouse.new(params).call
      redirect "/warehouse"
    end
  end
end

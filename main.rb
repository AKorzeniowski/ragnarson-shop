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
  BASKET = []

  class App < Sinatra::Base
    get "/" do
      products = FetchProducts.new.call
      erb :index
    end
  end
end
# ware.to_s
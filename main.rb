require_relative 'lib/product.rb'
require_relative 'lib/storage.rb'
require_relative 'lib/warehouse.rb'
require_relative 'lib/cart.rb'

products = [Product.new("Milk", 2, 23), Product.new("Book", 10, 8), Product.new("Gems", 100, 23)]

ware = Warehouse.new("Main", products)

ware.add(1, 1)
ware.add(2, 2)
ware.to_s

cart = Cart.new("Shopping", ware)
cart.add(1, 1)
cart.add(1, 2)
cart.add(3, 1)
cart.to_s

ware.remove(1)
ware.to_s
require_relative './product.rb'
require_relative './storage.rb'
require_relative './warehouse.rb'
require_relative './cart.rb'

products = [Product.new("Milk", 2, 23), Product.new("Book", 10, 8), Product.new("Gems", 100, 23)]

ware = Warehouse.new("Main", products)

ware.add(1, 1)
ware.add(2, 2)
ware.to_s
p ware

cart = Cart.new("Shopping", ware)
cart.add(1, 1)
cart.add(1, 2)
cart.add(3, 1)
cart.to_s
p cart

ware.remove(1)
ware.to_s

p cart
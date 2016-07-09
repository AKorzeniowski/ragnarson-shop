class Warehouse < Storage
  attr_reader :id, :name, :products, :content

  @@last_id = 0

  def initialize(name, products=[])
    @name = validate(name, String)
    @id = @@last_id += 1
    @content = []
    @products = products
  end

  def get_product(id) 
    product = products.find { |p| p.id == id } 
    unless product then raise ArgumentError end
    product
  end

  def to_s
    print "Magazyn #{name}\n"
    print "id\tname\tprice\tqty\n"

    content.each do |p|
      prod = get_product(id)
      print "#{p[:id]}\t#{prod.name}\t#{prod.price}\t\t#{p[:qty]}\n"
    end
  end
end
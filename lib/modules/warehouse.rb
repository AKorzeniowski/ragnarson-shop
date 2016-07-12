module Store
  class Warehouse
    require Storage 

    attr_reader :id, :name, :products, :content
  
    @@last_id = 0
  
    def initialize(id, name)
      @id = validate(id, Numeric)
      @name = validate(name, String)
      @content = []
    end
  
  =begin
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
  =end
    private
      def next_id 
        @@last_id += 1
      end
  end
end
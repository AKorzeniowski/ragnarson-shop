module Store
  class Cart
    attr_reader :id, :name, :warehouse, :content
    
    @@last_id = 0
  
    def initialize(name, warehouse)
      @name = name
      @id = @@last_id += 1
      @content = []
      @warehouse = warehouse
    end
  
    def remove(id) 
      super
      warehouse.add(id)
    end
  
    def to_s
      print "Koszyk #{name}\n"
      print "id\tname\tprice\tqty\n"
  
      content.each do |p|
        prod = warehouse.get_product(id)
        print "#{p[:id]}\t#{prod.name}\t#{prod.price}\t\t#{p[:qty]}\n"
      end
  
      sum(true)
      sum(false)
    end
    
      private
        def sum(brutto)
          sum = 0
  
          content.each do |p|
            product = warehouse.get_product(p[:id])
  
            if brutto 
              sum += product.price_with_vat * p[:qty]
            else
              sum += product.price * p[:qty]
            end
          end
  
          if brutto then print "Suma brutto: #{sum}\n" else print "Suma netto: #{sum}\n" end
        end
  
        def price_with_vat(price, vat)
          (price * (1+vat/100.0)).round(2)
        end
  end
end
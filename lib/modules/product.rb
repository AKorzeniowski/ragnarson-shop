module Store
  class Product
    require Storage
    attr_reader :id, :name, :price, :vat
  
    @@last_id = 0
    
    def initialize(name, price, vat=23)
      @id = @@last_id += 1
      @name = validate(name, String)
      @price = validate(price, Numeric)
      @vat = validate(vat, Numeric)
    end
  
    def validate(input, type)
      unless input.nil?
          if input.is_a? type then return input else raise TypeError end
      else
        raise ArgumentError
      end
    end

    private
    def next_id 
      @@last_id += 1
    end
  
    def price_with_vat
      (price * (1+vat/100.0)).round(2)
    end
  end
end
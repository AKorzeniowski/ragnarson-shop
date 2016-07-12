module Store
  class Warehouse
    attr_reader :id, :qty
  
    @@last_id = 0
  
    def initialize(id, qty)
      @id = validate(id, Numeric)
      @qty = validate(qty, Numeric)
    end
  
    def validate(input, type)
      unless input.nil?
          if input.is_a? type then return input else raise TypeError end
      else
        raise ArgumentError
      end
    end
  end
end
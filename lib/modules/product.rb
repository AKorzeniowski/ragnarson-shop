module Store
  class Product
    attr_reader :id, :name, :price, :vat

    @@last_id = 0

    def initialize(name, price, vat = 23)
      @id = next_id
      @name = validate(name, String)
      @price = validate(price, Numeric)
      @vat = validate(vat, Numeric)
    end

    def next_id
      @@last_id += 1
    end

    def validate(input, type)
      if input.nil?
        raise ArgumentError
      else
        input.is_a?(type) ? (return input) : (raise TypeError)
      end
    end

    def price_with_vat
      (price * (1 + vat / 100.0)).round(2)
    end
  end
end
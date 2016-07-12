module Store
  class Cart
    attr_reader :id, :qty
  
    def initialize(id, qty)
      @id = validate(id, Numeric)
      @qty = validate(id, Numeric)
    end

    def fetch_product 
      FetchProduct.new.call(id)
    end

    def net_product_price
      product = fetch_product
      product.price * qty
    end

    def gross_product_price
      product = fetch_product
      product.price_with_vat * qty
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
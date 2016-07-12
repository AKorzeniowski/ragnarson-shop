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

    def brutto_product_price
      product = fetch_product
      product.price * qty
    end

    def brutto_product_price
      product = fetch_product
      product.price_with_vat * qty
    end
  end
end
module Store
  class StorageItem
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(product_id, quantity = 1)
      @product_id = validate(product_id)
      @quantity = validate(quantity)
    end

    def fetch_product
      FetchProductById.new.call(product_id)
    end

    def net_product_price
      product = fetch_product
      product.price * quantity
    end

    def gross_product_price
      product = fetch_product
      product.price_with_vat * quantity
    end

    def validate(input)
      if input.nil?
        raise ArgumentError
      else
        (input.is_a?(Numeric) && input > 0) ? (return input) : (raise TypeError)
      end
    end
  end
end

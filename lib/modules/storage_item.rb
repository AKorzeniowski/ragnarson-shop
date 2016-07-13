module Store
  class StorageItem
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(product_id, quantity)
      @product_id = validate(product_id, Numeric)
      @quantity = validate(quantity, Numeric)
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

    def validate(input, type)
      if input.nil?
        raise ArgumentError
      else
        input.is_a?(type) ? (return input) : (raise TypeError)
      end
    end
  end
end

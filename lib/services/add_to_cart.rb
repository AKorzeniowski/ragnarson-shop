module Store 
  class AddToCart
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      CART << StorageItem.new(@product_id, @quantity)
    end
  end
end
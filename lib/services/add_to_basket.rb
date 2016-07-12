module Store 
  class AddToBasket
    def initialize(product_id, quantity)
      @product_id = product_id
      @quantity = quantity
    end

    def call
      BASKET << Basket.new(@product_id, @quantity)
    end
  end
end
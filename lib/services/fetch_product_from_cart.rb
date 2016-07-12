module Store
  class FetchProductFromCart
    def call(id)
      CART.find { |item| item.product_id == id.to_i }
    end
  end
end
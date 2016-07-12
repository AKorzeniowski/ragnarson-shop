module Store
  class FetchCart
    def call
      CART.map do |c| {
        product: c.fetch_product,
        quantity: c.quantity,
        total_price: c.net_product_price
      }
      end
    end
  end
end
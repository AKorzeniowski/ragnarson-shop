module Store
  class FetchCart
    def call
      CART.map do |item|
        {
          product: item.fetch_product,
          quantity: item.quantity,
          total_price: item.net_product_price
        }
      end
    end
  end
end

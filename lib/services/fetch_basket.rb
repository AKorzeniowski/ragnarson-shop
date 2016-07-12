module Store
  class FetchBasket
    def call
      BASKET.map do |b| {
        product: b.fetch_product,
        quantity: b.quantity,
        total_price: b.net_product_price
      }
      end
    end
  end
end
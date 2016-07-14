module Store
  class FetchWarehouse
    def call
      WAREHOUSE.map do |item|
        {
          product: item.fetch_product,
          quantity: item.quantity
        }
      end
    end
  end
end

module Store
  class FetchWarehouse
    def call
      WAREHOUSE.map do |c| {
        product: c.fetch_product,
        quantity: c.quantity
      }
      end
    end
  end
end

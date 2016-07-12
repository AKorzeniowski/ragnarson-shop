module Store
  class FetchProductFromWarehouse
    def call(id)
      WAREHOUSE.find { |item| item.product_id == id.to_i }
    end
  end
end
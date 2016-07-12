module Store
  class FetchWarehouse
    def call(id)
      WAREHOUSE.find { |item| item.id == id.to_i }
    end
  end
end
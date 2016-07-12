module Store
  class FetchWarehouse
    def call(id)
      Store::WAREHOUSE.find { |item| item.id == id.to_i }
    end
  end
end
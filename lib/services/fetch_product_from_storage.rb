module Store
  class FetchProductFromStorage
    def call(id, storage)
      storage.find { |item| item.product_id == id.to_i }
    end
  end
end

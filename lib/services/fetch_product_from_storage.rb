module Store
  class FetchProductFromStorage
    def call(id, storage)
      return unless product = storage.find { |item| item.product_id == id.to_i }
      product
    end
  end
end

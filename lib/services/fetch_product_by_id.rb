module Store
  class FetchProductById
    def call(id)
      raise ProductNotFoundError unless product = PRODUCTS.find { |p| p.id == id.to_i }
      product
    end
  end
end

module Store
  class CheckIfProductInStorage
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
    end

    def call(storage)
      raise ProductNotFoundError unless product = storage.find { |item| item.product_id == @product_id }
      product
    end
  end
end

require_relative './fetch_product_from_storage'

module Store
  class RemoveFromWarehouse
    def initialize(params)
      @product_id = params.fetch('product_id').to_i
    end

    def call
      item = FetchProductFromStorage.new.call(@product_id, WAREHOUSE)

      return unless item

      remove_item(item)
    end

    private

    def remove_item(item)
      if item.quantity > 1
        item.quantity -= 1
      else
        WAREHOUSE.delete(item)
      end
    end
  end
end

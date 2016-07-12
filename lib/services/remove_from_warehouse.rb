require_relative './fetch_product_from_warehouse'

module Store
  class RemoveFromWarehouse
    def call(id)
      item = FetchFromWarehouse.new.call(id)

      return unless item

      remove_item(item)
    end

    private
      def remove_item(item)
        unless item.quantity > 1
          item.quantity -= 1
        else
          WAREHOUSE.delete(item)
      end
    end
  end
end
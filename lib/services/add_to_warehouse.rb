require_relative './fetch_product_from_warehouse'

module Store
  class AddToWarehouse
    def call(product_id, quantity)
      item = FetchFromWarehouse.new.call(product_id)
      add_item(item)
    end

    private
      def add_item(item)
        if item
          item.quantity += 1
        else
          WAREHOUSE.push(StorageItem.new(product_id, quantity))
      end
    end
  end
end
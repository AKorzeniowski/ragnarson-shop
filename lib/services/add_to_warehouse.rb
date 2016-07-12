module Store 
  class AddToWarehouse
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      item = FetchProductFromStorage.new.call(@product_id, WAREHOUSE)
      add_item(item)
    end

    private
      def add_item(item)
        if item
          item.quantity += 1
        else
          WAREHOUSE.push(StorageItem.new(@product_id, @quantity))
      end
    end
  end
end
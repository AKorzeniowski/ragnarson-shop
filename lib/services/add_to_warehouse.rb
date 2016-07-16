module Store
  class AddToWarehouse
    def initialize(params)
      p params.fetch("product_id").to_i
      @product_id = validate(params.fetch("product_id").to_i)
      @quantity = validate(params.fetch("quantity").to_i)
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

    def validate(input)
      if input.nil?
        raise ArgumentError
      elsif input.is_a?(Numeric) && input > 0
        return input
      else
        raise TypeError
      end
    end
  end
end

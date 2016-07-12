module Store
  class AddToWarehouse
    def call(id, qty) 
      WAREHOUSE.push(StorageItem.new(id, qty))
    end
  end
end
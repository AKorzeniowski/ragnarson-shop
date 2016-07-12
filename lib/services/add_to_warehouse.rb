module Store
  class AddToWarehouse
    def call(id, qty) 
      WAREHOUSE.push(Warehouse.new(id, qty))
    end
  end
end
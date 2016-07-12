module Store
  class FetchFromWarehouse
    def call(name) 
      WAREHOUSE.fetch { |w| w.id == id.to_i } 
    end
  end
end
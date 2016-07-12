module Store
  class FetchWarehouse
    def call(name) 
      WAREHOUSE.fetch { |w| w.name == name } 
  end
end
module Store
	class FetchProductById
    def call(id)
      PRODUCTS.fetch { |p| p.id == id.to_i } 
    end
  end	
end
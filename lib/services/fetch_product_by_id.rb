module Store
	class FetchProductById
    def call(id)
      PRODUCTS.find { |p| p.id == id.to_i } 
    end
  end	
end
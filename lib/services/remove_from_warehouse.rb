require_relative './fetch_warehouse'

module Store
  class RemoveFromWarehouse
    def call(id)
      product = FetchFromWarehouse.new.call(id)

      return unless product

      remove_product(product)
    end

    private
      def remove_product(product)
        unless product.qty > 1
          product.qty -= 1
        else
          WAREHOUSE.delete(product)
      end
    end
  end
end
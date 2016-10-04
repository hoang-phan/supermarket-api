class ProductsController < ResourcesController
  private
    def supermarket
      @supermarket ||= Supermarket.find(params[:supermarket_id])
    end

    def collection
      @collection ||= supermarket.products
    end
end

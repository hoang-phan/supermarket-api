require 'rails_helper'

RSpec.describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/supermarkets/2/products').to route_to('products#index', supermarket_id: '2')
    end

    it 'routes to #show' do
      expect(get: '/supermarkets/2/products/1').to route_to('products#show', id: '1', supermarket_id: '2')
    end

    it 'routes to #create' do
      expect(post: '/supermarkets/2/products').to route_to('products#create', supermarket_id: '2')
    end

    it 'routes to #update via PUT' do
      expect(put: '/supermarkets/2/products/1').to route_to('products#update', id: '1', supermarket_id: '2')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/supermarkets/2/products/1').to route_to('products#update', id: '1', supermarket_id: '2')
    end

    it 'routes to #destroy' do
      expect(delete: '/supermarkets/2/products/1').to route_to('products#destroy', id: '1', supermarket_id: '2')
    end
  end
end

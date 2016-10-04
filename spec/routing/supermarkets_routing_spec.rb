require 'rails_helper'

RSpec.describe SupermarketsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/supermarkets').to route_to('supermarkets#index')
    end

    it 'routes to #show' do
      expect(get: '/supermarkets/1').to route_to('supermarkets#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/supermarkets').to route_to('supermarkets#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/supermarkets/1').to route_to('supermarkets#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/supermarkets/1').to route_to('supermarkets#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/supermarkets/1').to route_to('supermarkets#destroy', id: '1')
    end

  end
end

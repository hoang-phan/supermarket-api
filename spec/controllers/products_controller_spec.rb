require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let :attributes do
    {
      name: 'product 1',
      code: 'codecodecode'
    }
  end

  let!(:supermarket) { create(:supermarket) }
  let(:base_params) { { supermarket_id: supermarket.to_param } }
  let(:collection) { supermarket.products }

  it_behaves_like 'resources controller', 'product'
end

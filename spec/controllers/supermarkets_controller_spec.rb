require 'rails_helper'

RSpec.describe SupermarketsController, type: :controller do
  let(:base_params) { {} }
  let(:attributes) { { name: 'name' } }
  let(:collection) { Supermarket }

  it_behaves_like 'resources controller', 'supermarket'
end

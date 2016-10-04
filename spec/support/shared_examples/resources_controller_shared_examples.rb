RSpec.shared_examples 'resources controller' do |resource_key|
  let(:parsed_body) { JSON(response.body) }

  describe 'GET #index' do
    let!(:resource) { create(resource_key, base_params) }

    it 'renders all resources' do
      get :index, params: base_params
      expect(parsed_body[resource_key.pluralize][0]['id']).to eq resource.id
    end
  end

  describe 'GET #show' do
    let!(:resource) { create(resource_key, base_params) }
    let(:params) { base_params.merge id: resource.to_param }

    it 'render resource' do
      get :show, params: params
      expect(parsed_body[resource_key]['id']).to eq resource.id
    end
  end

  describe 'POST #create' do
    let(:params) { base_params.merge resource_key => attributes }

    context 'with valid params' do
      it 'creates a new resource' do
        expect {
          post :create, params: params
        }.to change(collection, :count).by(1)
      end

      it 'renders id' do
        post :create, params: params
        expect(parsed_body['id']).to eq collection.last.id
      end
    end

    context 'with invalid params' do
      let!(:resource) { create(resource_key, base_params.merge(attributes)) }
      let(:errors) { attributes.keys.map { |k| "#{k.to_s.humanize} has already been taken" } }

      it 'renders errors' do
        post :create, params: base_params.merge(resource_key => attributes)
        expect(parsed_body['errors']).to eq errors.to_sentence
      end
    end
  end

  describe 'PUT #update' do
    let!(:resource) { create(resource_key, base_params) }
    let(:params) { base_params.merge id: resource.to_param, resource_key => attributes }

    context 'with valid params' do
      it 'updates the requested resource' do
        put :update, params: params
        resource.reload
        attributes.each { |key, value| expect(resource.public_send(key)).to eq value }
      end

      it 'renders id' do
        put :update, params: params
        expect(parsed_body['id']).to eq resource.id
      end
    end

    context 'with invalid params' do
      let!(:other_resource) { create(resource_key, base_params.merge(attributes)) }
      let(:errors) { attributes.keys.map { |k| "#{k.to_s.humanize} has already been taken" } }

      it 'renders errors' do
        put :update, params: base_params.merge(id: resource.to_param, resource_key => attributes)
        expect(parsed_body['errors']).to eq errors.to_sentence
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:resource) { create(resource_key, base_params) }

    it 'destroys the requested resource' do
      expect {
        delete :destroy, params: base_params.merge(id: resource.to_param)
      }.to change(collection, :count).by(-1)
    end

    it 'renders id' do
      delete :destroy, params: base_params.merge(id: resource.to_param)
      expect(parsed_body['id']).to eq resource.id
    end
  end
end

require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  let(:valid_attributes) do
    {
      customer_name: 'John',
      customer_email: 'john@example.com',
      project_name: 'project name',
      feature_name: 'feature name'
    }
  end
  let(:invalid_attributes) { { a: 1 } }
  let(:current_user) { create(:admin_user) }
  before { sign_in(current_user) }

  describe 'GET #new' do
    it 'assigns a new request as @request' do
      get :new
      expect(assigns(:req)).to be_a_new(Request)
    end

    it 'renders `new` template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    subject(:do_request) { post :create, params: { request: attributes } }

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Request' do
        expect { do_request }.to change(Request, :count).by(1)
      end

      it 'redirects to the new request path' do
        do_request
        expect(response).to redirect_to new_request_path
      end

      it 'shows flash message' do
        do_request
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      it 'assigns a newly created but unsaved request as @req' do
        do_request
        expect(assigns(:req)).to be_a_new(Request)
      end

      it "re-renders the 'new' template" do
        do_request
        expect(response).to render_template('new')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  let(:request) { create(:request) }
  let(:valid_attributes) { { rate: 1, details: 'details' } }
  let(:invalid_attributes) { { a: 1 } }
  let(:current_user) { create(:admin_user) }

  before { sign_in(current_user) }

  describe 'GET #new' do
    it 'assigns a new feedback as @feedback' do
      get :new, params: { uid: request.uid }
      expect(assigns(:feedback)).to be_a_new(Feedback)
    end
  end

  describe 'POST #create' do
    subject(:do_request) { post :create, params: { uid: request.uid, feedback: attributes } }

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Feedback' do
        expect { do_request }.to change(Feedback, :count).by(1)
      end

      it 'assigns a newly created feedback as @feedback' do
        do_request
        expect(assigns(:feedback)).to eq Feedback.last
      end

      it 'redirects to the thank you page' do
        do_request
        expect(response).to redirect_to(thank_you_path)
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      it 'assigns a newly created but unsaved feedback as @feedback' do
        do_request
        expect(assigns(:feedback)).to be_a_new(Feedback)
      end

      it "re-renders the 'new' template" do
        do_request
        expect(response).to render_template('new')
      end
    end
  end
end

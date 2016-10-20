require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #thank_you' do
    it 'renders thank_you template' do
      get :thank_you
      expect(response).to render_template('thank_you')
    end
  end
end

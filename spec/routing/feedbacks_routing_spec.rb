require 'rails_helper'

RSpec.describe FeedbacksController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      route_params = { get: '/feedbacks/new' }
      expect(route_params).to route_to('feedbacks#new')
    end

    it 'routes to #create' do
      route_params = { post: '/feedbacks' }
      expect(route_params).to route_to('feedbacks#create')
    end
  end
end

require 'rails_helper'

RSpec.describe RequestsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      route_params = { get: '/requests/new' }
      expect(route_params).to route_to('requests#new')
    end

    it 'routes to #create' do
      route_params = { post: '/requests' }
      expect(route_params).to route_to('requests#create')
    end
  end
end

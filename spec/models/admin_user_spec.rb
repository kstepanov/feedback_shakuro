require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'has_many requests' do
    is_expected.to have_many(:requests)
  end
end

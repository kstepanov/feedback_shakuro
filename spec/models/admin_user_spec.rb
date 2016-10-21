require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'has many requests' do
    is_expected.to have_many(:requests).dependent(:nullify)
  end
end

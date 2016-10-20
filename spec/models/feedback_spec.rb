require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it 'belongs to request' do
    is_expected.to belong_to(:request)
  end
end

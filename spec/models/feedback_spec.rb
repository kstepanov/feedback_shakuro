require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it 'belongs to request' do
    is_expected.to belong_to(:request)
  end

  it 'titleizes customer name' do
    name = described_class.new(customer_name: 'test jr').customer_name
    expect(name).to eq 'Test Jr'
  end
end

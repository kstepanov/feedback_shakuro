require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it 'belongs to request' do
    is_expected.to belong_to(:request)
  end

  it 'titleizes customer name' do
    name = described_class.new(customer_name: 'test jr').customer_name
    expect(name).to eq 'Test Jr'
  end

  describe 'copies request fields when request assigned' do
    let(:request) { build :request }
    let(:feedback) { described_class.new(request: request) }

    it 'copies customer_name' do
      expect(feedback.customer_name).to eq request.customer_name
    end
    it 'copies customer_email' do
      expect(feedback.customer_email).to eq request.customer_email
    end
    it 'copies project_name' do
      expect(feedback.project_name).to eq request.project_name
    end
    it 'copies feature_name' do
      expect(feedback.feature_name).to eq request.feature_name
    end
  end
end

require 'rails_helper'

RSpec.describe Request, type: :model do
  it 'belongs to admin_user' do
    is_expected.to belong_to(:admin_user)
  end

  it 'has many feedbacks with nullify dependency' do
    is_expected.to have_many(:feedbacks).dependent(:nullify)
  end

  it 'validates project name exists' do
    is_expected.to validate_presence_of(:project_name)
  end

  it 'validates feature name exists' do
    is_expected.to validate_presence_of(:feature_name)
  end

  it 'validates customer name exists' do
    is_expected.to validate_presence_of(:customer_name)
  end

  it 'validates customer email exists' do
    is_expected.to validate_presence_of(:customer_email)
  end

  it 'allow good email' do
    is_expected.to allow_value('example@email.com').for(:customer_email)
  end

  it 'prohibit bad email' do
    is_expected.not_to allow_value('exampleemail.com').for(:customer_email)
  end

  it 'titleizes customer name' do
    name = described_class.new(customer_name: 'test jr').customer_name
    expect(name).to eq 'Test Jr'
  end
end

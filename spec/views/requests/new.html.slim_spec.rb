require 'rails_helper'

RSpec.describe 'requests/new', type: :view do
  before do
    assign(:req, build(:request))
    render
  end

  it 'renders new request form' do
    assert_select 'form[action=?][method=?]', requests_path, 'post'
  end

  it 'renders project name field' do
    assert_select 'input#request_project_name[name=?]', 'request[project_name]'
  end

  it 'renders feature name field' do
    assert_select 'input#request_feature_name[name=?]', 'request[feature_name]'
  end

  it 'renders customer name field' do
    assert_select 'input#request_customer_name[name=?]', 'request[customer_name]'
  end

  it 'renders customer email field' do
    assert_select 'input#request_customer_email[name=?]', 'request[customer_email]'
  end
end

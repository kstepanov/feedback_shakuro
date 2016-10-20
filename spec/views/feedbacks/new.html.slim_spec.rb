require 'rails_helper'

RSpec.describe 'feedbacks/new', type: :view do
  before do
    assign(:feedback, build(:feedback, request: build(:request)))
    render
  end

  it 'renders new feedback form' do
    assert_select 'form[action=?][method=?]', feedbacks_path, 'post'
  end

  it 'renders project name field' do
    assert_select 'input#feedback_project_name[name=?]', 'feedback[project_name]'
  end

  it 'renders feature name field' do
    assert_select 'input#feedback_feature_name[name=?]', 'feedback[feature_name]'
  end

  it 'renders rate field' do
    assert_select 'input#feedback_rate[name=?]', 'feedback[rate]'
  end

  it 'renders details field' do
    assert_select 'textarea#feedback_details[name=?]', 'feedback[details]'
  end
end

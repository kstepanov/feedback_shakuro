RSpec.describe 'Admin Feedback' do
  let(:admin_user) { create :admin_user }

  before { sign_in(admin_user) }

  it 'shows title' do
    visit '/admin/feedbacks'
    expect(find('#page_title')).to have_content('Feedbacks')
  end
end

RSpec.describe 'Admin Users' do
  let(:admin_user) { create :admin_user }

  before { sign_in(admin_user) }

  it 'shows title' do
    visit '/admin/admin_users'
    expect(find('#page_title')).to have_content('Users')
  end
end

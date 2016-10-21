RSpec.describe 'Dashboard' do
  let(:admin_user) { create :admin_user }

  before { sign_in(admin_user) }

  it 'shows dashboard' do
    visit '/admin'
    expect(find('#page_title')).to have_content('Dashboard')
  end
end

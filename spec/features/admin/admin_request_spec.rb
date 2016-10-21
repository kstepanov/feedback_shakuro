RSpec.describe 'Admin Requests' do
  let(:render) { visit '/admin/requests' }
  let(:admin_user) { create :admin_user }
  let(:creator) { create :user }

  before { sign_in(admin_user) }

  it 'shows title' do
    render
    expect(find('#page_title')).to have_content('Requests')
  end

  it 'shows requests data' do
    request = create :request
    render
    expect(html).to have_content(request.customer_name)
  end
end

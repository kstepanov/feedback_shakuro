RSpec.describe 'CMS sign in' do
  let!(:admin_user) { create :admin_user, email: 'test@example.com', password: '11111111' }

  before do
    visit '/admin/login'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
  end

  context 'with OK credentials' do
    let(:email) { admin_user.email }
    let(:password) { admin_user.password }

    it 'redirects to dashboard' do
      click_button 'Login'
      expect(page.html).to include 'Signed in successfully.'
    end
  end

  context 'with BAD credentials' do
    let(:email) { 'foo@bar.bazz' }
    let(:password) { 'BARBAZZ' }

    it 'shows error message' do
      click_button 'Login'
      expect(page.html).to include 'Invalid Email or password.'
    end
  end
end

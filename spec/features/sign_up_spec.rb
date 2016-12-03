feature "Sign Up" do

let(:email) { 'test@test.com' }
let(:password) { 'iloveunicorns' }

  scenario "goes to links pages after sign up" do
    sign_up
    expect(current_path).to include 'links'
  end

  scenario "displays welcome message" do
    sign_up
    expect(page).to have_content "Welcome"
    expect(page).to have_content email
  end
end

feature 'User sign up' do

  scenario 'requires matching confirmation password' do
    expect { sign_up(password_again: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'test@test.com',
    password: 'iloveunicorns',
    password_again: "iloveunicorns")
    visit '/sign_up'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_again, with: password_again
    click_button "Sign up"
  end
end

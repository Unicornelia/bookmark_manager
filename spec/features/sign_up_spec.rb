require 'spec_helper.rb'
require_relative 'web_helpers.rb'

feature 'Sign Up' do

let(:email) { 'test@test.com' }
let(:password) { 'password1234' }

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, test@test.com!")
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'user gets redirected to links after signing up ' do
    sign_up
    expect(page.current_path).to eq '/links'
  end
end

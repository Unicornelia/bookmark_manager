require 'spec_helper.rb'
require_relative 'web_helpers.rb'

feature 'Sign Up' do

let(:email) { 'test@test.com' }
let(:password) { 'password1234' }

  scenario 'user can fill out sign up form' do
    sign_up
  end

  scenario 'user gets redirected to links after signing up ' do
    sign_up
    expect(page.current_path).to eq '/links'
  end

  scenario 'links shows a welcome message' do
    sign_up
    expect(page).to have_content("Welcome!")
    expect(page).to have_content email
  end
end

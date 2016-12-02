require 'spec_helper.rb'
require './app/models/user.rb'

feature "Homepage", :feature => :type do
  scenario "see list of links on homepage" do

    Link.create(url: 'http://www.makersacademy.com', title: "Makers Academy")

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content ("Makers Academy")
    end
  end

  # describe User do
  #   subject (:user) {described_class.new(params)}
  #     it 'user count increases after signing up' do
  #       sign_up
  #     end
  # end
end

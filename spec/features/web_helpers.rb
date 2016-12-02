def sign_up
  visit '/sign_up_form'
  expect(page.status_code).to eq(200)
  fill_in(:email, with:"test@test.com")
  fill_in(:password, with: "password")
  click_button("Sign Up")
end

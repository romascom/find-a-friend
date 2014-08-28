def capybara_login(user)
  visit signin_path
  fill_in "Email", :with => user.email
  click_button "Sign in"
  expect(current_path).to eq root_path
end

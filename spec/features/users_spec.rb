require 'spec_helper'

# feature "manage users" do
#   background do
#     sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
#   end

#   scenario "user signs up" do
#     expect(page).to have_content("You have signed up successfully.")
#   end

#   scenario "user signs out" do
#     click_on "Logout"
#     expect(page).to have_content("Signed out successfully.")
#   end

#   scenario "user signs in" do
#     click_on "Logout"

#     sign_in_as("jdoe55@example.com", "foobar55")
#     expect(page).to have_content("Signed in successfully.")
#   end
# end

feature "visitor signs up" do
  scenario "successfully" do
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
    expect(page).to have_content("You have signed up successfully")
  end

  scenario "unsuccessfully with blank fields" do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'

    expect(page).to_not have_content "Signed in"
    expect(page).to have_content "can't be blank"
  end
end

feature "visitor signs in" do
  scenario "successfully" do
    User.create!(email: 'bob@example.com', password: 'password', username: 'bob')

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_link 'Sign out'
  end
end

feature "user signs out" do
  scenario "successfully" do
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
    click_on "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end

feature "display stories" do
  scenario "user visits homepage" do
    visit root_path
    expect(page).to have_content("Top Stories")
  end
end

require 'spec_helper'

feature "manage users" do
  background do
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
  end

  scenario "user signs up" do
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "user signs out" do
    click_on "Logout"
    expect(page).to have_content("Signed out successfully.")
  end

  scenario "user signs in" do
    click_on "Logout"

    sign_in_as("jdoe55@example.com", "foobar55")
    expect(page).to have_content("Signed in successfully.")
  end

  def sign_up_with(email, username, password)
    visit new_user_registration_path
    fill_in "Email", with: email
    fill_in "Username", with: username
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"
  end

  def sign_in_as(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end
end

feature "stories" do
  scenario "user visits homepage" do
    visit root_path
    expect(page).to have_content("Top Stories")
  end
end

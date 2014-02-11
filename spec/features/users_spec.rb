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
end

feature "stories" do
  scenario "user visits homepage" do
    visit root_path
    expect(page).to have_content("Top Stories")
  end
end

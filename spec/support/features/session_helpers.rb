module Features
  module SessionHelpers
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
end

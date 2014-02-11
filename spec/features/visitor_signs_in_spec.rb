require 'spec_helper'

feature 'Visitor signs in' do
  background do
    @user = create(:user)
    visit root_path
  end

  scenario 'successfully' do
    sign_in_as(@user)
    expect(page).to have_content "Signed in successfully"
    expect(page).to have_link 'Sign out'
  end

  scenario 'unsuccessfully with invalid credentials' do
    @user.password = 'wrongpassword'
    sign_in_as(@user)

    expect(page).to have_content 'Invalid email or password'
    expect(page).to_not have_content 'Signed in'
  end
end

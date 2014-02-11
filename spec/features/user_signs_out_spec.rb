require 'spec_helper'

feature 'user signs out' do
  scenario 'successfully' do
    user = create(:user)
    sign_in_as(user)

    click_link 'Sign out'

    expect(page).to_not have_content 'Signed in'
  end
end

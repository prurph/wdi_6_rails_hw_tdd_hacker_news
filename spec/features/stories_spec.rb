# require "spec_helper"

# feature "manage articles" do
#   background do
#     @creator = User.create(email: "hi@example.com", username: "creator",
#       password: "foobar56", password_confirmation: "foobar56")
#     @story = Story.create(title: "Lorem", description: "Ipsum",
#       link: "http://www.google.com", user_id: @creator.id)
#     @story2 = Story.create(title: "Morem", description: "Ipmas",
#       link: "http://www.reddit.com", user_id: @creator.id)
#     @story_hash = { title: "Loremore", description: "Ipmuch",
#       link: "http://www.peatarian.com" }
#   end

#   scenario "articles appear on main page" do
#     visit root_path

#     expect(page).to have_content("Top Stories")

#     expect(page).to have_content(@story.title)
#     expect(page).to have_content(@story.description)
#     expect(page).to have_link(@story.title, { href: @story.link } )

#     expect(page).to have_content(@story2.title)
#     expect(page).to have_content(@story2.description)
#     expect(page).to have_link(@story2.title, { href: @story2.link } )
#   end

#   scenario "user submits article" do
#     visit root_path
#     sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")

#     click_on "Submit"

#     fill_in "Title", with: @story_hash[:title]
#     fill_in "Description", with: @story_hash[:description]
#     fill_in "Link", with: @story_hash[:link]
#     click_on "Submit article"

#     expect(page).to have_content(@story_hash[:title])
#     expect(page).to have_content(@story_hash[:description])
#     expect(page).to have_link(@story_hash[:title], { href: @story_hash[:link] } )
#   end

#   scenario "user comments on article" do
#     visit root_path
#     sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")

#     first(".story").click_link("discuss")
#     fill_in "Comment", with: "What an awesome comment!"
#     click_on "Comment!"
#     expect(page).to have_content("What an awesome comment!")
#     expect(page).to have_content("jdoe55")
#   end

#   scenario "story show page will list all comments" do
#     visit root_path
#     sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
#     comment_on_first_with("My great first comment")

#     visit story_path(@story)
#     expect(page).to have_content("My great first comment")
#   end

#   scenario "user upvotes story" do
#     visit root_path
#     sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
#     first(".story").click_link("Upvote")
#     expect(page).to have_content("1 point")
#   end

#   context "user doesn't log in" do
#     scenario "user tries to upvote" do
#       visit root_path
#       first(".story").click_link("Upvote")
#       expect(page).to_not have_content("1 point")
#       expect(page).to have_content("Please log in")
#     end
#     scenario "user tries to submit article" do
#       visit root_path
#       click_on "Submit"
#       expect(page).to have_content("Please log in")
#     end
#     scenario "user tries to comment" do
#       visit root_path
#       first(".story").click_link("discuss")
#       expect(page).to have_content("Please log in")
#     end
#   end
# end

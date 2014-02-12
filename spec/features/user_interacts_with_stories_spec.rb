require 'spec_helper'

feature 'Visitor views stories' do
  background do
    @story = create(:story)
    @story2 = create(:story)
  end

  scenario 'on home page' do
    visit root_path

    expect(page).to have_content("Top Stories")

    expect(page).to have_content(@story.title)
    expect(page).to have_content(@story.description)
    expect(page).to have_link(@story.title, { href: @story.link } )

    expect(page).to have_content(@story2.title)
    expect(page).to have_content(@story2.description)
    expect(page).to have_link(@story2.title, { href: @story2.link } )
  end

  scenario 'on story show page' do
    comment = create(:comment, story: @story)
    visit story_path(@story)
    expect(page).to have_content(comment.body)
  end
end

feature 'User takes action' do
  context 'while signed in' do
    background do
      @user = create(:user)
      sign_in_as(@user)
      @story = create(:story)
      visit root_path
    end

    scenario 'by submitting story' do
      story = build(:story)
      click_on "Submit"

      fill_in "Title", with: story.title
      fill_in "Description", with: story.description
      fill_in "Link", with: story.link
      click_on "Submit article"

      expect(page).to have_content(story.title)
      expect(page).to have_content(story.description)
      expect(page).to have_link(story.title, { href: story.link } )
    end

    scenario 'by commenting on story' do
      comment = build(:comment)

      first(".story").click_link("discuss")
      fill_in "Comment", with: comment.body
      click_on "Comment!"

      expect(page).to have_content(comment.body)
      expect(page).to have_content(@user.username)
    end

    scenario 'by upvoting story' do
      within('.story') do
        click_on "Upvote"
      end
      within('.story') do
        expect(page).to have_content(@story.title)
        expect(page).to have_content('1 point')
      end
    end

    scenario 'by downvoting story' do
      within('.story') do
        click_on "Downvote"
      end
      within('.story') do
        expect(page).to have_content(@story.title)
        expect(page).to have_content('-1 points')
      end
    end

    scenario 'by downvoting an already downvoted story' do
      click_on "Downvote"
      click_on "Downvote"

      expect(page).to have_content(@story.title)
      expect(page).to have_content('-1 points')
      expect(page).to_not have_content('-3 points')
    end

    scenario 'by upvoting a downvoted story' do
      click_on "Downvote"
      click_on "Upvote"

      expect(page).to have_content(@story.title)
      expect(page).to have_content('1 point')
      expect(page).to_not have_content('-1 points')
    end
  end

  context 'while not signed in' do
    background do
      @story = create(:story)
      visit root_path
    end

    scenario "user tries to upvote" do
      within('.story') do
        click_on "Upvote"
      end
      expect(page).to_not have_content("1 point")
      expect(page).to have_content("Please log in")
    end

    scenario "user tries to downvote" do
      within('.story') do
        click_on "Downvote"
      end
      expect(page).to_not have_content("1 point")
      expect(page).to have_content("Please log in")
    end

    scenario "user tries to submit article" do
      click_on "Submit"
      expect(page).to have_content("Please log in")
    end
    scenario "user tries to comment" do
      first(".story").click_link("discuss")
      fill_in "Comment", with: "Sweet new comment!"
      click_on "Comment!"
      expect(page).to have_content("Please log in")
    end
  end
end

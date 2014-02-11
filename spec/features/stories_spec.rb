require "spec_helper"

feature "manage articles" do
  background do
    @story = Story.create(title: "Lorem", description: "Ipsum",
      link: "http://www.google.com", user_id: 1)
    @story2 = Story.create(title: "Morem", description: "Ipmas",
      link: "http://www.reddit.com", user_id: 2)
    @story_hash = { title: "Loremore", description: "Ipmuch",
      link: "http://www.peatarian.com" }
  end

  scenario "articles appear on main page" do
    visit root_path

    expect(page).to have_content("Top Stories")

    expect(page).to have_content(@story.title)
    expect(page).to have_content(@story.description)
    expect(page).to have_link(@story.title, { href: @story.link } )

    expect(page).to have_content(@story2.title)
    expect(page).to have_content(@story2.description)
    expect(page).to have_link(@story2.title, { href: @story2.link } )
  end

  scenario "user can submit article" do
    visit root_path
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")

    click_on "Submit"

    fill_in "Title", with: @story_hash[:title]
    fill_in "Description", with: @story_hash[:description]
    fill_in "Link", with: @story_hash[:link]
    click_on "Submit article"

    expect(page).to have_content(@story_hash[:title])
    expect(page).to have_content(@story_hash[:description])
    expect(page).to have_link(@story_hash[:title], { href: @story_hash[:link] } )
  end

  scenario "user can comment on article" do
    visit root_path
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")

    first(".story").click_link("discuss")
    fill_in "Comment", with: "What an awesome comment!"
    click_on "Comment!"
    expect(page).to have_content("What an awesome comment!")
    expect(page).to have_content("jdoe55")
  end

  scenario "story show page will list all comments" do
    visit root_path
    sign_up_with("jdoe55@example.com", "jdoe55", "foobar55")
    comment_on_first_with("My great first comment")

  end
end

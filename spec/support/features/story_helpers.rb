module Features
  module StoryHelpers
    def create_article_with(title, description, link)
      visit root_path

      click_on "Submit"
      fill_in "Title", with: title
      fill_in "Description", with: description
      fill_in "Link", with: link
      click_on "Submit article"
    end

    def comment_on_first_with(body)
      visit root_path

      first(".story").click_link("discuss")
      fill_in "Comment", with: body
      click_on "Comment!"
    end
  end
end

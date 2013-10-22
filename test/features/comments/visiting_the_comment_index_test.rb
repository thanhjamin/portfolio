require "test_helper"

feature "vistor visiting the post index" do
  scenario "vistor visits existing posts" do
    # Given existing posts
    visit comments_path

    # When I visit /posts
    click_on 'Read'

    # Then the existing posts should be loaded
    page.text.must_include 'Title'
    page.text.must_include 'Body'

  end
end

require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    @comment = Comment.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit comments_path

    # When I visit /posts
    click_on 'Show'

    # Then the existing posts should be loaded
    page.text.must_include 'Title'
    page.text.must_include 'Body'

  end
end

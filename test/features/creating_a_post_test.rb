require "test_helper"


feature "creating a post" do
  scenario "works with valid data" do
    visit comments_path

#Give a completed post form
visit comments_path
  click_on 'New Comment'
  fill_in 'Title', with: 'a new hope'
  fill_in 'Body', with: 'a long time ago in a galaxy far far away'

#When I submit the form
  click_on 'Create Comment'

#Then I should see the new post
  page.text.must_include 'a new hope'
  page.text.must_include 'a long time ago'

#And a success message
  page.text.must_include 'Comment was successfully created.'

  end
end


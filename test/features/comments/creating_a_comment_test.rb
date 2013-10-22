require "test_helper"

feature "creating a comment" do
  scenario "works with valid data" do
    sign_in_user

#Given a completed post form
visit new_comment_path

  fill_in 'Title', with: comments(:one).title
  fill_in 'Body', with: comments(:one).body

#When I submit the form
  click_on 'Post'

#And a success message
    page.text.must_include "Post was successfully created"
    page.text.must_include comments(:one).title
    page.has_css? "#author"
    page.text.must_include users(:one).email
  end

  scenario "authors can't publish" do
  sign_in_user
  visit new_comment_path
  page.wont_have_field('Publish')
  end
end

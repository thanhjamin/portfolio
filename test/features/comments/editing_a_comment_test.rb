require "test_helper"

feature "EditingAComment" do
  scenario "update existing comment" do
    sign_in_user
    visit comment_path(comments(:one))
    click_on 'Edit'
    fill_in 'Title', with: 'a new world'
    fill_in 'Body', with: 'Death star is almost complete'
    click_on 'Post'
    page.text.must_include 'a new world'
    page.text.must_include 'Death star is almost complete'
    page.text.must_include 'Post was successfully updated.'
  end
end

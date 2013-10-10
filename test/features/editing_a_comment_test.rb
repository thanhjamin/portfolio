require "test_helper"

feature "EditingAComment" do
  scenario "update existing comment" do
    visit comments_path
    click_on 'Edit'
    fill_in 'Title', with: 'a newer world'
    fill_in 'Body', with: 'Death star is dead'
    click_on 'Update Comment'
    page.text.must_include 'a newer world'
    page.text.must_include 'Death star is dead'
    page.text.must_include 'Comment was successfully updated.'
  end
end

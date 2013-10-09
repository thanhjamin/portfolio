require "test_helper"

feature "EditingAComment" do
  scenario "update existing comment" do
    @comment = Comment.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit comment_path(@comment)
    click_on 'Edit'
    fill_in 'Title', with: 'a newer world'
    fill_in 'Body', with: 'Death star is dead'
    click_on 'Update Comment'
    page.text.must_include 'a newer world'
    page.text.must_include 'Death star is dead'
    page.text.must_include 'Comment was successfully updated.'
  end
end

require "test_helper"

feature "DeletingAComment" do
  scenario "delete existing comment" do
    visit comments_path
    click_on "Delete"
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Learn by doing'
  end
end

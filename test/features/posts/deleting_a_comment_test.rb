require "test_helper"

feature "DeletingAComment" do
  scenario "delete existing comment" do
    visit comments_path
    click_link('Delete')
  end
end

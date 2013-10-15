require "test_helper"

feature "DeletingAComment" do
  scenario "delete existing comment" do
    visit projects_path
    click_on 'Delete'
  end
end

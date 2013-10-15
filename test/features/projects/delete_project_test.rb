require "test_helper"

feature "DeletingAProject" do
  scenario "delete existing project" do
    visit projects_path
    click_link('Destroy', href: "/projects/#{projects(:two).id}")
    page.text.must_include "Project was successfully deleted"
    page.text.wont_include "Project Name Two"
    page.text.wont_include "JavaScript"
  end
end

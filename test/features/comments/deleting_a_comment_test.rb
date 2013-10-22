require "test_helper"

feature "editor deleting a comment" do
  scenario "editor delete existing comment" do
    sign_in_user
    visit comments_path
    click_link("Delete", href: "/comments/#{comments(:one).id}")
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Learn by doing'
  end
end

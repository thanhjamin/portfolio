require "test_helper"

feature "CanAccessHome" do
  scenario "landing page is legit" do
    visit root_path
    page.must_have_content "Thanh Huynh"
    page.wont_have_content "Goobye All!"

  end
end

require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Thanh Huynh's Portfolio"
    page.wont_have_content "Goobye All!"

  end
end

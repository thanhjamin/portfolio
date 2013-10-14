require "test_helper"

feature "CheckForBootstrap" do
  scenario "detect bootstrap" do
    visit root_path
    page.body.must_include "navbar-default"
  end
end

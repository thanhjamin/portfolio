require "test_helper"

feature "As a user, I want to sign out when I'm done
  so that my session is closed." do
  scenario "sign out current user" do
    # Given a current user
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    page.must_have_content "Signed in successfully"
    page.must_have_content "Sign Out"

    # When the sign out link is clicked
    click_on "Sign Out"

    # Then the session should be destroyed
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Sign Out"
  end
end

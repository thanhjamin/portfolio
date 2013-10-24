require 'test_helper'

feature "editor approving remark in show view" do
  scenario "editor approves remark" do
    sign_in_user
    visit comment_path(comments(:one))

    fill_in :remark_author, with: "brogrammer"
    fill_in :remark_author_url, with: "www.programmerbros.com"
    fill_in :remark_author_email, with: "chad@programmerbros.com"
    fill_in :remark_content, with: "Noice Project brah!"
    click_on "Submit"

    page.text.must_include "Comment has been submitted for approval."

    click_on "Approve"

    page.text.must_include "Comment has been approved."
  end
end


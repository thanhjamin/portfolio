require 'test_helper'

feature "visitor leaving a remark in show" do
  scenario "visitor leaves remark" do
    visit comment_path(comments(:one))
    fill_in :remark_author, with: "brogrammer"
    fill_in :remark_author_url, with: "www.programmerbros.com"
    fill_in :remark_author_email, with: "chad@programmerbros.com"
    fill_in :remark_content, with: "Noice Project brah!"
    click_on "Submit"
    page.text.must_include "Comment has been submitted for approval."
  end
end

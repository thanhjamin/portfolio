require 'test_helper'

feature "visitor leaving a remark in show" do
  scenario "visitor leaves remark" do
    visit comment_path(comments(:one))
    fill_in :remark_author, with:
    fill_in :remark_author_url, with:
    fill_in :remark_author_email, with:
    fill_in :remark_content, with:

    click_on "Submit for approval"
  end
end

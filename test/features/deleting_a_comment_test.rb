require "test_helper"

feature "DeletingAComment" do
  scenario "delete existing comment" do
    @comment = Comment.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit comment_path(@comment)
    click_on 'Back'
    click_on 'Destroy'
  end
end

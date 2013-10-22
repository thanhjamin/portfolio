require 'test_helper'

feature 'editor publish a post' do
  scenario 'editor publishes a post' do
    sign_in_user
    visit comments_path
    page.text.must_include 'Code Rails'
    page.text.must_include 'Learn by doing'
    click_link('Publish')
    click_on 'Sign Out'
    visit comments_path
    page.text.must_include 'Code Rails'
    page.text.must_include 'Learn by doing'
  end
end

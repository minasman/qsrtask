require "application_system_test_case"

class CommentUpdatesTest < ApplicationSystemTestCase
  setup do
    @comment_update = comment_updates(:one)
  end

  test "visiting the index" do
    visit comment_updates_url
    assert_selector "h1", text: "Comment Updates"
  end

  test "creating a Comment update" do
    visit comment_updates_url
    click_on "New Comment Update"

    click_on "Create Comment update"

    assert_text "Comment update was successfully created"
    click_on "Back"
  end

  test "updating a Comment update" do
    visit comment_updates_url
    click_on "Edit", match: :first

    click_on "Update Comment update"

    assert_text "Comment update was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment update" do
    visit comment_updates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment update was successfully destroyed"
  end
end

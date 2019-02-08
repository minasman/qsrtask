require 'test_helper'

class CommentUpdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_update = comment_updates(:one)
  end

  test "should get index" do
    get comment_updates_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_update_url
    assert_response :success
  end

  test "should create comment_update" do
    assert_difference('CommentUpdate.count') do
      post comment_updates_url, params: { comment_update: {  } }
    end

    assert_redirected_to comment_update_url(CommentUpdate.last)
  end

  test "should show comment_update" do
    get comment_update_url(@comment_update)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_update_url(@comment_update)
    assert_response :success
  end

  test "should update comment_update" do
    patch comment_update_url(@comment_update), params: { comment_update: {  } }
    assert_redirected_to comment_update_url(@comment_update)
  end

  test "should destroy comment_update" do
    assert_difference('CommentUpdate.count', -1) do
      delete comment_update_url(@comment_update)
    end

    assert_redirected_to comment_updates_url
  end
end

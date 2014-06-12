require 'test_helper'

class BenmarksControllerTest < ActionController::TestCase
  setup do
    @benmark = benmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benmark" do
    assert_difference('Benmark.count') do
      post :create, benmark: { url: @benmark.url, user_id: @benmark.user_id }
    end

    assert_redirected_to benmark_path(assigns(:benmark))
  end

  test "should show benmark" do
    get :show, id: @benmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @benmark
    assert_response :success
  end

  test "should update benmark" do
    patch :update, id: @benmark, benmark: { url: @benmark.url, user_id: @benmark.user_id }
    assert_redirected_to benmark_path(assigns(:benmark))
  end

  test "should destroy benmark" do
    assert_difference('Benmark.count', -1) do
      delete :destroy, id: @benmark
    end

    assert_redirected_to benmarks_path
  end
end

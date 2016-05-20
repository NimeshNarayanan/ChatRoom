require 'test_helper'

class StickiesControllerTest < ActionController::TestCase
  setup do
    @sticky = stickies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stickies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should form sticky" do
    assert_difference('Sticky.count') do
      post :form, sticky: {content: @sticky.content, title: @sticky.title, users: @sticky.users }
    end

    assert_redirected_to sticky_path(assigns(:sticky))
  end

  test "should show sticky" do
    get :show, id: @sticky
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sticky
    assert_response :success
  end

  test "should update sticky" do
    patch :update, id: @sticky, sticky: { content: @sticky.content, title: @sticky.title, users: @sticky.users }
    assert_redirected_to sticky_path(assigns(:sticky))
  end

  test "should destroy sticky" do
    assert_difference('Sticky.count', -1) do
      delete :destroy, id: @sticky
    end

    assert_redirected_to stickies_path
  end
end

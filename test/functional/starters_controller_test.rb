require 'test_helper'

class StartersControllerTest < ActionController::TestCase
  setup do
    @starter = starters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:starters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create starter" do
    assert_difference('Starter.count') do
      post :create, starter: { avatar: @starter.avatar, class_id1: @starter.class_id1, class_id2: @starter.class_id2, class_id3: @starter.class_id3, email: @starter.email, first_name: @starter.first_name, last_name: @starter.last_name, password_digest: @starter.password_digest, quarter: @starter.quarter, skill_id1: @starter.skill_id1, skill_id2: @starter.skill_id2, skill_id3: @starter.skill_id3, year: @starter.year }
    end

    assert_redirected_to starter_path(assigns(:starter))
  end

  test "should show starter" do
    get :show, id: @starter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @starter
    assert_response :success
  end

  test "should update starter" do
    put :update, id: @starter, starter: { avatar: @starter.avatar, class_id1: @starter.class_id1, class_id2: @starter.class_id2, class_id3: @starter.class_id3, email: @starter.email, first_name: @starter.first_name, last_name: @starter.last_name, password_digest: @starter.password_digest, quarter: @starter.quarter, skill_id1: @starter.skill_id1, skill_id2: @starter.skill_id2, skill_id3: @starter.skill_id3, year: @starter.year }
    assert_redirected_to starter_path(assigns(:starter))
  end

  test "should destroy starter" do
    assert_difference('Starter.count', -1) do
      delete :destroy, id: @starter
    end

    assert_redirected_to starters_path
  end
end

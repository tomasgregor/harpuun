require 'test_helper'

class ContractorsControllerTest < ActionController::TestCase
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post :create, contractor: { avatar_url: @contractor.avatar_url, company: @contractor.company, email: @contractor.email, first_name: @contractor.first_name, last_name: @contractor.last_name, password_digest: @contractor.password_digest }
    end

    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should show contractor" do
    get :show, id: @contractor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contractor
    assert_response :success
  end

  test "should update contractor" do
    put :update, id: @contractor, contractor: { avatar_url: @contractor.avatar_url, company: @contractor.company, email: @contractor.email, first_name: @contractor.first_name, last_name: @contractor.last_name, password_digest: @contractor.password_digest }
    assert_redirected_to contractor_path(assigns(:contractor))
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete :destroy, id: @contractor
    end

    assert_redirected_to contractors_path
  end
end

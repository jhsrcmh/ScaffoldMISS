require 'test_helper'

class EverydayChecksControllerTest < ActionController::TestCase
  setup do
    @everyday_check = everyday_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:everyday_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create everyday_check" do
    assert_difference('EverydayCheck.count') do
      post :create, everyday_check: { checktime: @everyday_check.checktime, everydaycheck_id: @everyday_check.everydaycheck_id, everydaycheckform: @everyday_check.everydaycheckform, project_id: @everyday_check.project_id, remarkinf: @everyday_check.remarkinf, user_id: @everyday_check.user_id }
    end

    assert_redirected_to everyday_check_path(assigns(:everyday_check))
  end

  test "should show everyday_check" do
    get :show, id: @everyday_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @everyday_check
    assert_response :success
  end

  test "should update everyday_check" do
    put :update, id: @everyday_check, everyday_check: { checktime: @everyday_check.checktime, everydaycheck_id: @everyday_check.everydaycheck_id, everydaycheckform: @everyday_check.everydaycheckform, project_id: @everyday_check.project_id, remarkinf: @everyday_check.remarkinf, user_id: @everyday_check.user_id }
    assert_redirected_to everyday_check_path(assigns(:everyday_check))
  end

  test "should destroy everyday_check" do
    assert_difference('EverydayCheck.count', -1) do
      delete :destroy, id: @everyday_check
    end

    assert_redirected_to everyday_checks_path
  end
end

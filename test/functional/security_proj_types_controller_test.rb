require 'test_helper'

class SecurityProjTypesControllerTest < ActionController::TestCase
  setup do
    @security_proj_type = security_proj_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_proj_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_proj_type" do
    assert_difference('SecurityProjType.count') do
      post :create, security_proj_type: { priority: @security_proj_type.priority, remarkinf: @security_proj_type.remarkinf, securityprojtypename: @security_proj_type.securityprojtypename }
    end

    assert_redirected_to security_proj_type_path(assigns(:security_proj_type))
  end

  test "should show security_proj_type" do
    get :show, id: @security_proj_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_proj_type
    assert_response :success
  end

  test "should update security_proj_type" do
    put :update, id: @security_proj_type, security_proj_type: { priority: @security_proj_type.priority, remarkinf: @security_proj_type.remarkinf, securityprojtypename: @security_proj_type.securityprojtypename }
    assert_redirected_to security_proj_type_path(assigns(:security_proj_type))
  end

  test "should destroy security_proj_type" do
    assert_difference('SecurityProjType.count', -1) do
      delete :destroy, id: @security_proj_type
    end

    assert_redirected_to security_proj_types_path
  end
end

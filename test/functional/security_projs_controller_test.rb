require 'test_helper'

class SecurityProjsControllerTest < ActionController::TestCase
  setup do
    @security_proj = security_projs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_projs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_proj" do
    assert_difference('SecurityProj.count') do
      post :create, security_proj: { detail: @security_proj.detail, ifpass: @security_proj.ifpass, name: @security_proj.name, project_id: @security_proj.project_id, remarkinf: @security_proj.remarkinf, security_proj_type_id: @security_proj.security_proj_type_id, user_id: @security_proj.user_id }
    end

    assert_redirected_to security_proj_path(assigns(:security_proj))
  end

  test "should show security_proj" do
    get :show, id: @security_proj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_proj
    assert_response :success
  end

  test "should update security_proj" do
    put :update, id: @security_proj, security_proj: { detail: @security_proj.detail, ifpass: @security_proj.ifpass, name: @security_proj.name, project_id: @security_proj.project_id, remarkinf: @security_proj.remarkinf, security_proj_type_id: @security_proj.security_proj_type_id, user_id: @security_proj.user_id }
    assert_redirected_to security_proj_path(assigns(:security_proj))
  end

  test "should destroy security_proj" do
    assert_difference('SecurityProj.count', -1) do
      delete :destroy, id: @security_proj
    end

    assert_redirected_to security_projs_path
  end
end

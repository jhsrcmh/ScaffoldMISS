require 'test_helper'

class ReformsControllerTest < ActionController::TestCase
  setup do
    @reform = reforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reform" do
    assert_difference('Reform.count') do
      post :create, reform: { project_id: @reform.project_id, reformdoc: @reform.reformdoc, reformmark: @reform.reformmark, reformresponse: @reform.reformresponse, reformtype: @reform.reformtype, remarkinf: @reform.remarkinf, user_id: @reform.user_id }
    end

    assert_redirected_to reform_path(assigns(:reform))
  end

  test "should show reform" do
    get :show, id: @reform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reform
    assert_response :success
  end

  test "should update reform" do
    put :update, id: @reform, reform: { project_id: @reform.project_id, reformdoc: @reform.reformdoc, reformmark: @reform.reformmark, reformresponse: @reform.reformresponse, reformtype: @reform.reformtype, remarkinf: @reform.remarkinf, user_id: @reform.user_id }
    assert_redirected_to reform_path(assigns(:reform))
  end

  test "should destroy reform" do
    assert_difference('Reform.count', -1) do
      delete :destroy, id: @reform
    end

    assert_redirected_to reforms_path
  end
end

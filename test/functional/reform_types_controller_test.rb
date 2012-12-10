require 'test_helper'

class ReformTypesControllerTest < ActionController::TestCase
  setup do
    @reform_type = reform_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reform_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reform_type" do
    assert_difference('ReformType.count') do
      post :create, reform_type: { name: @reform_type.name }
    end

    assert_redirected_to reform_type_path(assigns(:reform_type))
  end

  test "should show reform_type" do
    get :show, id: @reform_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reform_type
    assert_response :success
  end

  test "should update reform_type" do
    put :update, id: @reform_type, reform_type: { name: @reform_type.name }
    assert_redirected_to reform_type_path(assigns(:reform_type))
  end

  test "should destroy reform_type" do
    assert_difference('ReformType.count', -1) do
      delete :destroy, id: @reform_type
    end

    assert_redirected_to reform_types_path
  end
end

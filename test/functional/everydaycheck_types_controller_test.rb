require 'test_helper'

class EverydaycheckTypesControllerTest < ActionController::TestCase
  setup do
    @everydaycheck_type = everydaycheck_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:everydaycheck_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create everydaycheck_type" do
    assert_difference('EverydaycheckType.count') do
      post :create, everydaycheck_type: { everydaychecktype: @everydaycheck_type.everydaychecktype, priority: @everydaycheck_type.priority, remarkinf: @everydaycheck_type.remarkinf }
    end

    assert_redirected_to everydaycheck_type_path(assigns(:everydaycheck_type))
  end

  test "should show everydaycheck_type" do
    get :show, id: @everydaycheck_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @everydaycheck_type
    assert_response :success
  end

  test "should update everydaycheck_type" do
    put :update, id: @everydaycheck_type, everydaycheck_type: { everydaychecktype: @everydaycheck_type.everydaychecktype, priority: @everydaycheck_type.priority, remarkinf: @everydaycheck_type.remarkinf }
    assert_redirected_to everydaycheck_type_path(assigns(:everydaycheck_type))
  end

  test "should destroy everydaycheck_type" do
    assert_difference('EverydaycheckType.count', -1) do
      delete :destroy, id: @everydaycheck_type
    end

    assert_redirected_to everydaycheck_types_path
  end
end

require 'test_helper'

class CloseTypesControllerTest < ActionController::TestCase
  setup do
    @close_type = close_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:close_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create close_type" do
    assert_difference('CloseType.count') do
      post :create, close_type: { closetypename: @close_type.closetypename, priority: @close_type.priority, remarkinf: @close_type.remarkinf }
    end

    assert_redirected_to close_type_path(assigns(:close_type))
  end

  test "should show close_type" do
    get :show, id: @close_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @close_type
    assert_response :success
  end

  test "should update close_type" do
    put :update, id: @close_type, close_type: { closetypename: @close_type.closetypename, priority: @close_type.priority, remarkinf: @close_type.remarkinf }
    assert_redirected_to close_type_path(assigns(:close_type))
  end

  test "should destroy close_type" do
    assert_difference('CloseType.count', -1) do
      delete :destroy, id: @close_type
    end

    assert_redirected_to close_types_path
  end
end

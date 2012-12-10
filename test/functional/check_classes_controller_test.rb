require 'test_helper'

class CheckClassesControllerTest < ActionController::TestCase
  setup do
    @check_class = check_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_class" do
    assert_difference('CheckClass.count') do
      post :create, check_class: { checkclassname: @check_class.checkclassname, priority: @check_class.priority, remarkinf: @check_class.remarkinf }
    end

    assert_redirected_to check_class_path(assigns(:check_class))
  end

  test "should show check_class" do
    get :show, id: @check_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_class
    assert_response :success
  end

  test "should update check_class" do
    put :update, id: @check_class, check_class: { checkclassname: @check_class.checkclassname, priority: @check_class.priority, remarkinf: @check_class.remarkinf }
    assert_redirected_to check_class_path(assigns(:check_class))
  end

  test "should destroy check_class" do
    assert_difference('CheckClass.count', -1) do
      delete :destroy, id: @check_class
    end

    assert_redirected_to check_classes_path
  end
end

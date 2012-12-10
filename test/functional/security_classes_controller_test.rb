require 'test_helper'

class SecurityClassesControllerTest < ActionController::TestCase
  setup do
    @security_class = security_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_class" do
    assert_difference('SecurityClass.count') do
      post :create, security_class: { remarkinf: @security_class.remarkinf, securityclassgrade: @security_class.securityclassgrade, securityclassname: @security_class.securityclassname, securityfathername: @security_class.securityfathername }
    end

    assert_redirected_to security_class_path(assigns(:security_class))
  end

  test "should show security_class" do
    get :show, id: @security_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_class
    assert_response :success
  end

  test "should update security_class" do
    put :update, id: @security_class, security_class: { remarkinf: @security_class.remarkinf, securityclassgrade: @security_class.securityclassgrade, securityclassname: @security_class.securityclassname, securityfathername: @security_class.securityfathername }
    assert_redirected_to security_class_path(assigns(:security_class))
  end

  test "should destroy security_class" do
    assert_difference('SecurityClass.count', -1) do
      delete :destroy, id: @security_class
    end

    assert_redirected_to security_classes_path
  end
end

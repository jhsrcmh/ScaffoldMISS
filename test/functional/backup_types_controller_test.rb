require 'test_helper'

class BackupTypesControllerTest < ActionController::TestCase
  setup do
    @backup_type = backup_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backup_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backup_type" do
    assert_difference('BackupType.count') do
      post :create, backup_type: { backuptypename: @backup_type.backuptypename, importance: @backup_type.importance }
    end

    assert_redirected_to backup_type_path(assigns(:backup_type))
  end

  test "should show backup_type" do
    get :show, id: @backup_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backup_type
    assert_response :success
  end

  test "should update backup_type" do
    put :update, id: @backup_type, backup_type: { backuptypename: @backup_type.backuptypename, importance: @backup_type.importance }
    assert_redirected_to backup_type_path(assigns(:backup_type))
  end

  test "should destroy backup_type" do
    assert_difference('BackupType.count', -1) do
      delete :destroy, id: @backup_type
    end

    assert_redirected_to backup_types_path
  end
end

require 'test_helper'

class BackupinfsControllerTest < ActionController::TestCase
  setup do
    @backupinf = backupinfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backupinfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backupinf" do
    assert_difference('Backupinf.count') do
      post :create, backupinf: { backinf: @backupinf.backinf, backupclass_id: @backupinf.backupclass_id, name: @backupinf.name, project_id: @backupinf.project_id, remarkinf: @backupinf.remarkinf, user_id: @backupinf.user_id }
    end

    assert_redirected_to backupinf_path(assigns(:backupinf))
  end

  test "should show backupinf" do
    get :show, id: @backupinf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backupinf
    assert_response :success
  end

  test "should update backupinf" do
    put :update, id: @backupinf, backupinf: { backinf: @backupinf.backinf, backupclass_id: @backupinf.backupclass_id, name: @backupinf.name, project_id: @backupinf.project_id, remarkinf: @backupinf.remarkinf, user_id: @backupinf.user_id }
    assert_redirected_to backupinf_path(assigns(:backupinf))
  end

  test "should destroy backupinf" do
    assert_difference('Backupinf.count', -1) do
      delete :destroy, id: @backupinf
    end

    assert_redirected_to backupinfs_path
  end
end

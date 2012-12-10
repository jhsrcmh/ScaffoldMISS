require 'test_helper'

class CheckinfsControllerTest < ActionController::TestCase
  setup do
    @checkinf = checkinfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkinfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkinf" do
    assert_difference('Checkinf.count') do
      post :create, checkinf: { checkclass_id: @checkinf.checkclass_id, checkform: @checkinf.checkform, checktime: @checkinf.checktime, project_id: @checkinf.project_id, remarkinf: @checkinf.remarkinf, user_id: @checkinf.user_id }
    end

    assert_redirected_to checkinf_path(assigns(:checkinf))
  end

  test "should show checkinf" do
    get :show, id: @checkinf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkinf
    assert_response :success
  end

  test "should update checkinf" do
    put :update, id: @checkinf, checkinf: { checkclass_id: @checkinf.checkclass_id, checkform: @checkinf.checkform, checktime: @checkinf.checktime, project_id: @checkinf.project_id, remarkinf: @checkinf.remarkinf, user_id: @checkinf.user_id }
    assert_redirected_to checkinf_path(assigns(:checkinf))
  end

  test "should destroy checkinf" do
    assert_difference('Checkinf.count', -1) do
      delete :destroy, id: @checkinf
    end

    assert_redirected_to checkinfs_path
  end
end

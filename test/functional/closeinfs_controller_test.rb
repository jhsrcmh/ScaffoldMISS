require 'test_helper'

class CloseinfsControllerTest < ActionController::TestCase
  setup do
    @closeinf = closeinfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:closeinfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create closeinf" do
    assert_difference('Closeinf.count') do
      post :create, closeinf: { Closeinf: @closeinf.Closeinf, closedtl: @closeinf.closedtl, closeinf_type_id: @closeinf.closeinf_type_id, closetime: @closeinf.closetime, name: @closeinf.name, project_id: @closeinf.project_id, remarkinf: @closeinf.remarkinf, user_id: @closeinf.user_id }
    end

    assert_redirected_to closeinf_path(assigns(:closeinf))
  end

  test "should show closeinf" do
    get :show, id: @closeinf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @closeinf
    assert_response :success
  end

  test "should update closeinf" do
    put :update, id: @closeinf, closeinf: { Closeinf: @closeinf.Closeinf, closedtl: @closeinf.closedtl, closeinf_type_id: @closeinf.closeinf_type_id, closetime: @closeinf.closetime, name: @closeinf.name, project_id: @closeinf.project_id, remarkinf: @closeinf.remarkinf, user_id: @closeinf.user_id }
    assert_redirected_to closeinf_path(assigns(:closeinf))
  end

  test "should destroy closeinf" do
    assert_difference('Closeinf.count', -1) do
      delete :destroy, id: @closeinf
    end

    assert_redirected_to closeinfs_path
  end
end

require 'test_helper'

class RefDataControllerTest < ActionController::TestCase
  setup do
    @ref_datum = ref_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_datum" do
    assert_difference('RefDatum.count') do
      post :create, ref_datum: @ref_datum.attributes
    end

    assert_redirected_to ref_datum_path(assigns(:ref_datum))
  end

  test "should show ref_datum" do
    get :show, id: @ref_datum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_datum.to_param
    assert_response :success
  end

  test "should update ref_datum" do
    put :update, id: @ref_datum.to_param, ref_datum: @ref_datum.attributes
    assert_redirected_to ref_datum_path(assigns(:ref_datum))
  end

  test "should destroy ref_datum" do
    assert_difference('RefDatum.count', -1) do
      delete :destroy, id: @ref_datum.to_param
    end

    assert_redirected_to ref_data_path
  end
end

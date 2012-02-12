require 'test_helper'

class TerapeutaControllerTest < ActionController::TestCase
  setup do
    @terapeuta = terapeuta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terapeuta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create Terapeuta" do
    assert_difference('Terapeuta.count') do
      post :create, Terapeuta: @terapeuta.attributes
    end

    assert_redirected_to Terapeuta_path(assigns(:Terapeuta))
  end

  test "should show Terapeuta" do
    get :show, id: @terapeuta.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @terapeuta.to_param
    assert_response :success
  end

  test "should update Terapeuta" do
    put :update, id: @terapeuta.to_param, Terapeuta: @terapeuta.attributes
    assert_redirected_to Terapeuta_path(assigns(:Terapeuta))
  end

  test "should destroy Terapeuta" do
    assert_difference('Terapeuta.count', -1) do
      delete :destroy, id: @terapeuta.to_param
    end

    assert_redirected_to terapeuta_path
  end
end

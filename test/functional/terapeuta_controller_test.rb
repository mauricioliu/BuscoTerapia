require 'test_helper'

class TerapeutaControllerTest < ActionController::TestCase
  setup do
    @terapeutum = terapeuta(:one)
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

  test "should create terapeutum" do
    assert_difference('Terapeutum.count') do
      post :create, terapeutum: @terapeutum.attributes
    end

    assert_redirected_to terapeutum_path(assigns(:terapeutum))
  end

  test "should show terapeutum" do
    get :show, id: @terapeutum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @terapeutum.to_param
    assert_response :success
  end

  test "should update terapeutum" do
    put :update, id: @terapeutum.to_param, terapeutum: @terapeutum.attributes
    assert_redirected_to terapeutum_path(assigns(:terapeutum))
  end

  test "should destroy terapeutum" do
    assert_difference('Terapeutum.count', -1) do
      delete :destroy, id: @terapeutum.to_param
    end

    assert_redirected_to terapeuta_path
  end
end

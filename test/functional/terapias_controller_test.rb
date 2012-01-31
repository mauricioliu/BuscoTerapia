require 'test_helper'

class TerapiasControllerTest < ActionController::TestCase
  setup do
    @terapia = terapias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terapias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create terapia" do
    assert_difference('Terapia.count') do
      post :create, terapia: @terapia.attributes
    end

    assert_redirected_to terapia_path(assigns(:terapia))
  end

  test "should show terapia" do
    get :show, id: @terapia.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @terapia.to_param
    assert_response :success
  end

  test "should update terapia" do
    put :update, id: @terapia.to_param, terapia: @terapia.attributes
    assert_redirected_to terapia_path(assigns(:terapia))
  end

  test "should destroy terapia" do
    assert_difference('Terapia.count', -1) do
      delete :destroy, id: @terapia.to_param
    end

    assert_redirected_to terapias_path
  end
end

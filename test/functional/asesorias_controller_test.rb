require 'test_helper'

class AsesoriasControllerTest < ActionController::TestCase
  setup do
    @asesoria = asesoria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asesoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asesoria" do
    assert_difference('Asesoria.count') do
      post :create, asesoria: @asesoria.attributes
    end

    assert_redirected_to asesoria_path(assigns(:asesoria))
  end

  test "should show asesoria" do
    get :show, id: @asesoria.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asesoria.to_param
    assert_response :success
  end

  test "should update asesoria" do
    put :update, id: @asesoria.to_param, asesoria: @asesoria.attributes
    assert_redirected_to asesoria_path(assigns(:asesoria))
  end

  test "should destroy asesoria" do
    assert_difference('Asesorium.count', -1) do
      delete :destroy, id: @asesoria.to_param
    end

    assert_redirected_to asesorias_path
  end
end

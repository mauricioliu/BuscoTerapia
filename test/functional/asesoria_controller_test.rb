require 'test_helper'

class AsesoriaControllerTest < ActionController::TestCase
  setup do
    @asesorium = asesoria(:one)
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

  test "should create asesorium" do
    assert_difference('Asesorium.count') do
      post :create, asesorium: @asesorium.attributes
    end

    assert_redirected_to asesorium_path(assigns(:asesorium))
  end

  test "should show asesorium" do
    get :show, id: @asesorium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asesorium.to_param
    assert_response :success
  end

  test "should update asesorium" do
    put :update, id: @asesorium.to_param, asesorium: @asesorium.attributes
    assert_redirected_to asesorium_path(assigns(:asesorium))
  end

  test "should destroy asesorium" do
    assert_difference('Asesorium.count', -1) do
      delete :destroy, id: @asesorium.to_param
    end

    assert_redirected_to asesoria_path
  end
end

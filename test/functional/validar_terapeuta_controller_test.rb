require 'test_helper'

class ValidarTerapeutaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get validar" do
    get :validar
    assert_response :success
  end

end

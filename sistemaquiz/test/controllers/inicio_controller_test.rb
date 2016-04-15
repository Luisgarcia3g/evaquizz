require 'test_helper'

class InicioControllerTest < ActionController::TestCase
  test "should get maestro" do
    get :maestro
    assert_response :success
  end

end

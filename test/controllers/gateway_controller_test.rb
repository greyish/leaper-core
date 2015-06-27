require 'test_helper'

class GatewayControllerTest < ActionController::TestCase
  test "should get bouncer" do
    get :bouncer
    assert_response :success
  end

end

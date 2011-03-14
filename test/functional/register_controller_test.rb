require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get registred" do
    get :registred
    assert_response :success
  end

end

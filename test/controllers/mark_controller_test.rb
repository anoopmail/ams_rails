require 'test_helper'

class MarkControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

end

require 'test_helper'

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get only:" do
    get demo_only:_url
    assert_response :success
  end

  test "should get [:index]" do
    get demo_[:index]_url
    assert_response :success
  end

end

require 'test_helper'

class Admin::OrderDatailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_datails_update_url
    assert_response :success
  end

end

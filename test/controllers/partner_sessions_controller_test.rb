require 'test_helper'

class PartnerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partner_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get partner_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get partner_sessions_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_admin = admin_admins(:one)
  end

  test "should get index" do
    get admin_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_admin_url
    assert_response :success
  end

  test "should create admin_admin" do
    assert_difference('Admin::Admin.count') do
      post admin_admins_url, params: { admin_admin: { email: @admin_admin.email, password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to admin_admin_url(Admin::Admin.last)
  end

  test "should show admin_admin" do
    get admin_admin_url(@admin_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_admin_url(@admin_admin)
    assert_response :success
  end

  test "should update admin_admin" do
    patch admin_admin_url(@admin_admin), params: { admin_admin: { email: @admin_admin.email, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to admin_admin_url(@admin_admin)
  end

  test "should destroy admin_admin" do
    assert_difference('Admin::Admin.count', -1) do
      delete admin_admin_url(@admin_admin)
    end

    assert_redirected_to admin_admins_url
  end
end

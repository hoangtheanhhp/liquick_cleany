require "application_system_test_case"

class Admin::AdminsTest < ApplicationSystemTestCase
  setup do
    @admin_admin = admin_admins(:one)
  end

  test "visiting the index" do
    visit admin_admins_url
    assert_selector "h1", text: "Admin/Admins"
  end

  test "creating a Admin" do
    visit admin_admins_url
    click_on "New Admin/Admin"

    fill_in "Email", with: @admin_admin.email
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Create Admin"

    assert_text "Admin was successfully created"
    click_on "Back"
  end

  test "updating a Admin" do
    visit admin_admins_url
    click_on "Edit", match: :first

    fill_in "Email", with: @admin_admin.email
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Update Admin"

    assert_text "Admin was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin" do
    visit admin_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin was successfully destroyed"
  end
end

require 'test_helper'

class ContactUserTest < ActiveSupport::TestCase
  setup do
    ContactUser.delete_all
  end
  test "email should be present and valid" do
    contact_user = ContactUser.new
    assert_not contact_user.save, "Saved the contact user without an email"
    contact_user = ContactUser.new
    contact_user.email = ''
    assert_not contact_user.save, "Saved the contact user without an email"
    contact_user = ContactUser.new
    contact_user.email = 'invalid email'
    assert_not contact_user.save, "Saved the contact user without an email"
    contact_user = ContactUser.new
    contact_user.email = 'test@test.co'
    assert contact_user.save, "Saved the contact user with an email"
  end
  test "email should be unique" do
    contact_user = ContactUser.new
    contact_user.email = 'test@test.co'
    assert contact_user.save, "Saved the contact user with an valid email"
    contact_user = ContactUser.new
    contact_user.email = 'test@test.co'
    assert_not contact_user.save, "Saved the contact user with the same email"
  end
end

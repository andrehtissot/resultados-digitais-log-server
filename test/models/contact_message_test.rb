require 'test_helper'

class ContactMessageTest < ActiveSupport::TestCase
  setup do
    ContactUser.delete_all
    ContactMessage.delete_all
    @contact_user = ContactUser.create email: 'test@test.co'
    @valid_contact_message = ContactMessage.new contact_user_id: @contact_user._id, name: 'Valid',
      message: 'Test message'
  end

  test "should allow valid contact message to be saved" do
    assert @valid_contact_message.save, "Saved the valid contact message"
  end

  test "contact_user_id should be present and valid" do
    @valid_contact_message.contact_user_id = nil
    assert_not @valid_contact_message.save, "Saved the invalid contact message"
  end
end

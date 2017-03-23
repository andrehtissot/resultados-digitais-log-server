require 'test_helper'

class PageVisitTest < ActiveSupport::TestCase
  setup do
    ContactUser.delete_all
    ContactMessage.delete_all
    PageVisit.delete_all
    @contact_user = ContactUser.create email: 'test@test.co'
    @contact_message = ContactMessage.create contact_user_id: @contact_user._id,
      name: 'Valid', message: 'Test message'
    @page_visit = PageVisit.new contact_message_id: @contact_message._id, page_name: 'Home',
      time: DateTime.now, url: 'https://andretissot.com/test'
  end

  test "should allow valid contact message to be saved" do
    assert @page_visit.save, "Saved the valid contact message"
  end

  test "time should be present and valid" do
    @page_visit.time = ''
    assert_not @page_visit.save, "Saved the invalid contact message"
    @page_visit.time = nil
    assert_not @page_visit.save, "Saved the invalid contact message"
  end

  test "pageName should be present and valid" do
    @page_visit.page_name = ''
    assert_not @page_visit.save, "Saved the invalid contact message"
  end

  test "url should be present and valid" do
    @page_visit.url = ''
    assert_not @page_visit.save, "Saved the invalid contact message"
    @page_visit.url = 'sdadsassada'
    assert_not @page_visit.save, "Saved the invalid contact message"
  end

  test "contact_message_id should be present and valid" do
    @page_visit.contact_message_id = nil
    assert_not @page_visit.save, "Saved the invalid contact message"
  end
end

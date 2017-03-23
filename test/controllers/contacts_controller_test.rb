require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ContactUser.delete_all
    ContactMessage.delete_all
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('ContactUser.count') do
      assert_difference('ContactMessage.count') do
        post contacts_url(format: :json), params: { email: 'test@email.com', name: 'Test name',
          message: 'Test message'}
      end
    end
    assert_response :success
  end

  test "should not create contact without email" do
    assert_no_difference('ContactUser.count') do
      assert_no_difference('ContactMessage.count') do
        post contacts_url(format: :json), params: { email: '', name: 'Test name',
          message: 'Test message'}
      end
    end
    assert_response :unprocessable_entity
  end

  test "should show contact" do
    contact_user = ContactUser.create email: 'test@test.co'
    get contact_url(contact_user)
    assert_response :success
  end

  test "should create contact and return id" do
    post contacts_url(format: :json), params: { email: 'test@email.com', name: 'Test name',
      message: 'Test message'}
    json = JSON.parse @response.body
    assert_equal 'success', json['status']
    assert_equal String, json['messageId'].class
    assert_response :success
  end
end

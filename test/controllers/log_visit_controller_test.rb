require 'test_helper'

class LogControllerTest < ActionDispatch::IntegrationTest
  setup do
    ContactUser.delete_all
    ContactMessage.delete_all
    PageVisit.delete_all
    @contact_user = ContactUser.create email: 'test@test.co'
    @contact_message = ContactMessage.create contact_user_id: @contact_user._id,
      name: 'Valid', message: 'Test message'
  end

  test "should not create without params" do
    post log_visit_create_url(format: :json)
    assert_response :unprocessable_entity
  end

  test "should not create without accessEmail" do
    log = 'Home;1490279736131;file:///home/andre/Projects/rails/exampleWebPages/index.htm;Preço;'+
      '1490279748153;file:///home/andre/Projects/rails/exampleWebPages/price.htm'
    post log_visit_create_url(format: :json), params: { log: log }
    assert_response :unprocessable_entity
  end

  test "should not create without log" do
    post log_visit_create_url(format: :json), params: { messageId: @contact_message._id }
    assert_response :unprocessable_entity
  end

  test "should create contact" do
    assert_difference('PageVisit.count', 2) do
      log = 'Home;1490279736131;file:///home/andre/Projects/rails/exampleWebPages/index.htm;Preço;'+
        '1490279748153;file:///home/andre/Projects/rails/exampleWebPages/price.htm'
      post log_visit_create_url(format: :json), params: {log: log, messageId: @contact_message._id}
    end
    assert_response :success
  end
end

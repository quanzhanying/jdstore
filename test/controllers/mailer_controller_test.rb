require 'test_helper'

class MailerControllerTest < ActionDispatch::IntegrationTest
  test "should get OrderMailer" do
    get mailer_OrderMailer_url
    assert_response :success
  end

end

require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase

  def order_mail_preview
    OrderMailer.order_email(User.last)
  end

end

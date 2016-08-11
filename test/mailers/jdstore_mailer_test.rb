require 'test_helper'

class JdstoreMailerTest < ActionMailer::TestCase
  test "invoice_confirm" do
    mail = JdstoreMailer.invoice_confirm
    assert_equal "Invoice confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

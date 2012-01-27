require 'test_helper'

class TerapeutaMailerTest < ActionMailer::TestCase
  test "send_password" do
    mail = TerapeutaMailer.send_password
    assert_equal "Send password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "forgot_password" do
    mail = TerapeutaMailer.forgot_password
    assert_equal "Forgot password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

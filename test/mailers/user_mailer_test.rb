require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "application_notification" do
    mail = UserMailer.application_notification
    assert_equal "Application notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

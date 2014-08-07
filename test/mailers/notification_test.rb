require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "join_team" do
    mail = Notification.join_team
    assert_equal "Join team", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

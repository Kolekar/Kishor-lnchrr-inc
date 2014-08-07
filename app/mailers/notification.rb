class Notification < ActionMailer::Base
  default from: "staff@launcherr.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.join_team.subject
  #
  def join_team(post, message, requested_user)
    @post = post
    @to = @post.user
    @greeting = message
    @requested_user = requested_user
    mail(:to => @to.email, :subject => "Your project is quicky gaining traction!", :from => "staff@launcherr.com")
  end
end
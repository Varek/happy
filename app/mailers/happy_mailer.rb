class HappyMailer < ActionMailer::Base
  default from: "Happy <rieck@qringo.net>"

  def happiness_reminder(user)
    @user = user
    mail(:to => user.email, :subject => 'Happiness reminder')
  end
end

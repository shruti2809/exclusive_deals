class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.code_confirmation.subject
  #

  def code_confirmation(user)
    @greeting = "Hi"
    @user9 = user
    @deal_time = (user.created_at + 1.minute).strftime("%I:%M:%S")

    mail to: user.email, subject: "Code confirmation"
  end


end

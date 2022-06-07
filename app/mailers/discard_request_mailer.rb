class DiscardRequestMailer < ApplicationMailer
  default from: 'example@email.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def discard_send_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Your repair request has been discarded')
  end
end

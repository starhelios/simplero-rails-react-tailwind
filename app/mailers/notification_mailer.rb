class NotificationMailer < ApplicationMailer
  default from: 'jackson.noda.dev@gmail.com'
  
  def notification
    @user = params[:user]
    @body = params[:body]
    @url  = 'http://example.com/login'
    mail(to:  @user.email, subject: 'Notification from the app.')
  end
end

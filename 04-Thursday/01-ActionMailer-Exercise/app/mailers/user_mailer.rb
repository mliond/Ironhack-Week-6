class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    @url = 'http://www.myapp.com'
    mail(to: @user.email, subject: 'Welcome to Taskly')
  end

  handle_asynchronously :welcome

end

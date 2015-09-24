class UserMailerPreview < ActionMailer::Preview
  def welcome_preview
    UserMailer.welcome(User.first)
  end
end

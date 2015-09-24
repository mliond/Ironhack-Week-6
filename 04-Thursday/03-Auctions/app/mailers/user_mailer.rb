class UserMailer < ApplicationMailer

  def purchase(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Congrats on your purchase of #{@product.name}')
  end
    handle_asynchronously :purchase
end

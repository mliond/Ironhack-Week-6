class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  unless Rails.env.development?
  	protect_from_forgery with: :exception
  end
  include SessionsHelper

  before_action :login_required

  private

  def login_required
    unless logged_in?
      redirect_to login_path
    end
  end

end

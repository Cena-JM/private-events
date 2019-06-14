# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def logged_in
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end
end

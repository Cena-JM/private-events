# frozen_string_literal: true

module SessionsHelper

  def logged_in
    return if current_user

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
end

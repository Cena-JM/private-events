# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in
    return if current_user

    flash[:danger] = 'Please log in.'
    redirect_to signin_url
  end
end

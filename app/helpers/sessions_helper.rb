# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    !session[:user_id].nil?
  end
end

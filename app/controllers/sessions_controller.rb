# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      log_in(user)
      flash[:success] = 'You are now logged in'
      redirect_to root_url
    else
      flash.now[:danger] = 'Wrong email address'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end

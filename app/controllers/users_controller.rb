# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @past_created_events = @user.previous_events('created')
    @upcoming_created_events = @user.upcoming_events('created')
    @past_attended_events = @user.previous_events('attended')
    @upcoming_attended_events = @user.upcoming_events('attended')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = 'Welcome!'
      log_in @user
      redirect_to user_path(@user)
    else
      flash.now[:info] = "User couldn't be created"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

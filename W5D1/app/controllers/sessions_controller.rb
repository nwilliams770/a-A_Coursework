class SessionsController < ApplicationController

  # before_action :require_logged_in, only: [:destroy]
  # before_action :require_logged_out, only: [:new, :create]

  def create
    @user = User.find_by_credentials(params[:user][:email],
    params[:user][:password])

    if @user.nil?
      flash.now[:errors] = ["Invalid username/password"]
      render :new
    else
      login!(@user)
      redirect_to bands_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end

end

class UsersController < ApplicationController

  #before action for logged in and logged out; get those to work


  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      # update later or *BONUS* add show page
      redirect_to bands_url
    else
      #put errors in application views
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

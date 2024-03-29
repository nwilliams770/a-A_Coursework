class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end

class SubsController < ApplicationController

  #must be logged in to do anything here, edit method
  # is already filtering out subs by that user
  #does there need to be another method in app controller?
  before_action :ensure_ownership, only: [:edit]

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:erorrs] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find(params[:id])
  end

  def update
    #should this also filter for current_user subs?
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_ownership
    @sub = current_user.subs.find(params[:id])
    redirect_to subs_url unless @sub
  end

end

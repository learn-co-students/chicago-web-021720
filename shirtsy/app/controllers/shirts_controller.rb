class ShirtsController < ApplicationController
  include SessionsHelper
  before_action :authorize!, only: [:new, :create]

  def index
    @shirts = Shirt.all
    respond_to do |format|
      format.html {
        render :index 
      }
      format.json { 
        render json: @shirts
      }
    end
  end

  def new
    set_users
    @shirt = Shirt.new
  end

  def create
    @shirt = current_user.shirts.new(shirt_params)
    if @shirt.save
      redirect_to @shirt.creator
    else
      set_users
      render :new
    end
  end

  def show
    set_shirt
  end

  def edit
    set_shirt
    set_users
  end

  def update
    set_shirt
    @shirt.assign_attributes(shirt_params)
    if @shirt.save
      redirect_to @shirt
    else
      set_users
      render :edit
    end
  end

  def destroy
    set_shirt
    @shirt.destroy
    p @shirt
    redirect_to shirts_path
  end

  private

  def shirt_params
    params.require(:shirt).permit(:color, :message, :image, :price)
  end

  def set_shirt
    @shirt = Shirt.find(params[:id])
  end

  def set_users
    @users = User.all
  end
end

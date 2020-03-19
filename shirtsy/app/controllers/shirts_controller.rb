class ShirtsController < ApplicationController

  def index
    @shirts = Shirt.all
  end

  def new
    @users = User.all
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new(shirt_params)
    if @shirt.save
      redirect_to @shirt.creator
    else
      @users = User.all
      render :new
    end
  end

  def show
    @shirt = Shirt.find(params[:id])
  end

  private

  def shirt_params
    params.require(:shirt).permit(:color, :message, :image, :price, :creator_id)
  end
end

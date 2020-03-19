class SalesController < ApplicationController
  before_action :set_shirt, only: [:new, :create]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    set_users
  end

  def create
    @sale = @shirt.sales.new(sale_params)

    if @sale.save
      redirect_to sales_path
    else
      set_users
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:quantity, :buyer_id)
  end

  def set_shirt
    @shirt = Shirt.find_by(id: params[:shirt_id])
  end

  def set_users
    @users = User.all
  end
end
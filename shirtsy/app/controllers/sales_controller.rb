class SalesController < ApplicationController

  def index
    @sales = Sale.all
    p @sales
  end

  def new
    @sale = Sale.new
    @users = User.all
    @shirt = Shirt.find_by(id: params[:shirt_id])
  end

  def create
    @shirt = Shirt.find_by(id: params[:shirt_id])
    @sale = @shirt.sales.new(sale_params)

    if @sale.save
      redirect_to sales_path
    else
      @users = User.all
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:quantity, :buyer_id)
  end
end
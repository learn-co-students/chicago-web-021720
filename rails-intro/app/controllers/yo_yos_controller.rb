class YoYosController < ApplicationController

  def index
    @yo_yos = YoYo.all
  end

  def new

  end

  def show
    @yo_yo = YoYo.find(params[:id])
  end
end

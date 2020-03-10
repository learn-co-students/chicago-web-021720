require "./config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    erb :welcome
  end

  # Index
  get "/flowers" do
    @flowers = Flower.all
    erb :index
  end

  # New
  get "/flowers/new" do
    erb :new
  end

  # Create
  post "/flowers" do
    flower = Flower.new(
      kind: params[:kind],
      color: params[:color],
      price: params[:price]
    )
    flower.save
    redirect "/flowers"
  end

  # Show
  get "/flowers/:id" do
    @flower = Flower.find_by(id: params[:id])
    erb :show
  end

end

class ApplicationController < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "../views") }

  get '/books/?' do
    p @foobar
    # List all books
    @books = Book.all
    erb :index
  end

  get '/books/:id' do
    p params
    @book = Book.find(params[:id])
    erb :show
  end

  get '/redirect-test' do
    @foobar = "snails"
    p @foobar
    p 'redirecting'
    redirect '/books'
  end

  get '/books-by-title' do
    # Book.where("title LIKE 'the small rain'")
  end
end

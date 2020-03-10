class ApplicationController < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "../views") }
  set :method_override, true

  # Index
  get "/books/?" do
    # p @foobar
    # List all books
    @books = Book.all
    erb :index
  end
  
  # New
  get "/books/new" do
    erb :new
  end

  # Show
  get "/books/:id" do
    p params
    find_book
    erb :show
  end
  
  # Create
  post "/books" do
    p "******************"
    p params
    # binding.pry

    book = Book.new(
      title: params[:title], 
      author: params[:author], 
      snippet: params[:snippet]
    )

    book.save

    redirect "/books"
  end

  # Edit
  get "/books/:id/edit" do
    find_book
    erb :edit
  end

  # Update
  put "/books/:id" do
    find_book

     @book.assign_attributes(
      title: params[:title], 
      author: params[:author], 
      snippet: params[:snippet]
    )

    @book.save

    redirect "/books/#{@book.id}"
  end

  delete "/books/:id" do
    find_book
    @book.destroy
    redirect "/books"
  end

  # get '/redirect-test' do
  #   @foobar = "snails"
  #   p @foobar
  #   p 'redirecting'
  #   redirect '/books'
  # end

  # get '/books-by-title' do
  #   # TODO: IMPLEMENT TITLE SEARCH
  #   # Book.where("title LIKE 'the small rain'")
  # end

  def find_book
    @book = Book.find(params[:id])
  end
end

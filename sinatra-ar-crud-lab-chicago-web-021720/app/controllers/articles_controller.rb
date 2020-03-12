class ArticlesController < ApplicationController
  # Index
  get '/articles' do
    @articles = Article.all
    puts @articles[0]
    erb :'articles/index'
  end

  # New
  get '/articles/new' do
    erb :'articles/new'
  end

  # Create
  post '/articles' do
    article = Article.new(params[:article])
    article.save
    redirect "/articles/#{article.id}"
  end

  # Show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :'articles/show'
  end

  # Edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :'articles/edit'
  end

  # Update
  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.assign_attributes(params[:article])
    article.save
    redirect "/articles/#{article.id}"
  end
end
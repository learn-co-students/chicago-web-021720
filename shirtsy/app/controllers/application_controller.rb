class ApplicationController < ActionController::Base

  def welcome
    redirect_to new_shirt_path
  end
end


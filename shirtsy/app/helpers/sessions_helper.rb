module SessionsHelper

  def current_user
    # returns current user of app based on session
    @_current ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    #returns true if there's a current user, false otherwise
    !!current_user
  end

  def authorize!
    if !logged_in?
      flash[:warning] = "You must be logged in to do that"
      redirect_to login_path
    end
  end
end
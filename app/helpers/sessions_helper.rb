module SessionsHelper
  def logged_in?
    current_user.nil?
  end

  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
    @current_user
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    current_user = nil
    session[:user_id] = nil
  end
end

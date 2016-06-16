class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_game

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_game
    @current_game ||= Game.find(session[:game_id]) if session[:game_id]
  end

end

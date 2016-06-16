class GamesController < ApplicationController

  def create
    SunlightService.new.load_data
    game = current_user.games.create
    session[:game_id] = game.id
    redirect_to game_path(game.id)
  end

  def show
    if current_game && current_game.user.id == current_user.id
      @senator = Senator.all.sample
      @senator = Senator.not_used(current_game.used_senators)[0]
    else
      redirect_to home_path
    end
  end

  # def game_over
  #   game = Game.find(params[:id])
  #   @game_score = game.score
  #   redirect_to game_over_path(game.id)
  # end

end

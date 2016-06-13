class GamesController < ApplicationController

  def create
    game = Game.new
    game.user = current_user
    game.save!
    redirect_to game_path(game.id)
  end

  def show
    game = Game.find(params[:id])
    if game && game.user.id == current_user.id
      @game = game
      @senator = Senator.not_used(game.used_senators)
    else
      redirect_to home_path
    end
  end

end

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
      @senator = Senator.not_used(game.used_senators)[0]
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

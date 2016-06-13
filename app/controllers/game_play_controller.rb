class GamePlayController < ApplicationController

  def index
    game = Game.find(params[:game_id])
    senator = Senator.find(params[:senator_id])
    in senator.state == params[:guess]
      # correct!
    else
      # incorrect!
    end
    game.used_senators << senator.id
    redirect_to game_path(game.id)
  end

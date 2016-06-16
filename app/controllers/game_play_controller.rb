class GamePlayController < ApplicationController

  def index
    senator = Senator.find(params[:senator_id])
    #modify check to take different forms of state input
    #game score dashboard
    #move to poro or as a module on game class
    if senator.state_name == params[:guess]
      # correct!
      current_game.score += 1
      current_game.save
    else
      # incorrect!
      redirect_to game_over_path
    end
    game.used_senators << senator.id
    # redirect_to game_path(game.id)
  end

  def game_over
    game = Game.find(params[:game_id])
    @game_score = game.score
  end

end

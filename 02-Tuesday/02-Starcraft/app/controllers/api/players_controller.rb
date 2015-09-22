class Api::PlayersController < ApplicationController

  def index
    matches = Match.all
    render json: matches
  end

  def show
    player_id = params[:id]
    total_matches = Player.players_matches(player_id)
    win_percentage = Player.win_percentage(player_id, total_matches)
    loss_percentage = Player.loss_percentage(player_id, total_matches)
    win_loss_by_faction = Player.win_loss_by_faction(player_id)
    render json: {matches: total_matches, win_percentage: win_percentage, loss_percentage: loss_percentage, by_faction: win_loss_by_faction }
  end

  # def show
  #   player = Player.find_by(id: params[:id])
  #   matches = Match.where(winner_id: player.id)
  #   render json: matches
  # end



end

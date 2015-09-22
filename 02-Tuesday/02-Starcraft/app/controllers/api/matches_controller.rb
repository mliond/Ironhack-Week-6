class Api::MatchesController < ApplicationController

  def faction_show
    searchTerm = params[:faction]
    matches = Match.faction_matches(searchTerm)
    percentage_won = Match.faction_percentage_won(searchTerm)
    render json: {matches: matches, percentage_won: percentage_won }
  end

end

class Match < ActiveRecord::Base

  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  def self.faction_matches(searchTerm)
    matches = Match.where("winner_faction = ? or loser_faction = ?", searchTerm, searchTerm)
  end

  def self.faction_percentage_won(searchTerm)
    number_matches = Match.all.count
    won_matches = Match.where(winner_faction: searchTerm).count
    percentage_won = ((won_matches * 100) / number_matches)
  end

end

class Player < ActiveRecord::Base

  def self.players_matches(searchTerm)
    matches = Match.where("winner_id = ? or loser_id = ?", searchTerm, searchTerm)
  end

  def self.win_percentage(searchTerm, matches)
    total_matches = matches.count
    won_matches = Match.where("winner_id = ?", searchTerm).count
    win_percentage = ((won_matches * 100) / total_matches)
  end

  def self.loss_percentage(searchTerm, matches)
    total_matches = matches.count
    lost_matches = Match.where("loser_id = ?", searchTerm).count
    loss_percentage = ((lost_matches * 100) / total_matches)
  end

  def self.won_games_by_faction(searchTerm)
    won_matches = Match.where("winner_id = ?", searchTerm)
    won_ZERG = won_TERRAN = won_PROTOSS = 0
    won_matches.each do |i|
      case i.winner_faction
        when "ZERG"
          won_ZERG += 1
        when "TERRAN"
          won_TERRAN += 1
        when "PROTOSS"
          won_PROTOSS += 1
      end
    end
    return {z: won_ZERG, t: won_TERRAN, p: won_PROTOSS}
  end

  def self.lost_games_by_faction(searchTerm)
    lost_matches = Match.where("loser_id = ?", searchTerm)
    lost_ZERG = lost_TERRAN = lost_PROTOSS = 0
    lost_matches.each do |i|
      case i.loser_faction
        when "ZERG"
          lost_ZERG += 1
        when "TERRAN"
          lost_TERRAN += 1
        when "PROTOSS"
          lost_PROTOSS += 1
      end
    end
    return {z: lost_ZERG, t: lost_TERRAN, p: lost_PROTOSS}
  end

  def self.win_loss_by_faction(searchTerm)
    won = self.won_games_by_faction(searchTerm)
    lost = self.lost_games_by_faction(searchTerm)
    return {ZERG: "#{won[:z]} / #{lost[:z]}", TERRAN: "#{won[:t]} / #{lost[:t]}", PROTOSS: "#{won[:p]} / #{lost[:p]}"}
  end

end

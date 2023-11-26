# $LOAD_PATH << '.'
# require 'load_drop_dead.rb'
class GameManager
  def initialize(player_manager)
    @player_manager = player_manager
  end

  def determine_winner
    # Winner determination logic
    winner = @player_manager.players_list.max_by(&:total_score)
    puts "The winner is player #{winner.name} with a total score of #{winner.total_score} "
  end
end
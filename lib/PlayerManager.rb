class PlayerManager
  attr_accessor :players_list
  def initialize
    @players_list = []
  end

  def create_players(player_count, dice_count)
    (1..player_count).each do |player_id|
      player = Player.new(player_id, dice_count)
      @players_list << player
    end
  end
end

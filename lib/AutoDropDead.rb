# $LOAD_PATH << '.'
# require 'load_drop_dead.rb'
class AutoDropDead
    def initialize
        @player_manager = PlayerManager.new
        @game_engine = GameLogic.new(@player_manager)
        @game_manager = GameManager.new(@player_manager)
      end

    def play_game(sides, dice_count, player_count)
        player_count = player_count.to_i
        dice_count = dice_count.to_i
        sides = sides.to_i

        @player_manager.create_players(player_count, dice_count)
        @game_engine.execute_game(sides, dice_count, player_count)
        @game_manager.determine_winner
    end
end
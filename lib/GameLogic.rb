# $LOAD_PATH << '.'
# require 'load_drop_dead.rb'
class GameLogic

    def initialize(player_manager)
        @player_scores = []
        @prng = Random.new(1234)
        @player_manager = player_manager
    end
    
    def update_total()
        #update the player total score
        @current_player.total_score = @total
        puts "Total Score = #{@total}\n\n"
    end

    def rolled_two_or_five(rolled_value)
        # remove one dice from the players dices
        @current_player.dice_count = @current_player.dice_count - 1
        # remove the rolled value (2 or 5) from the players rolled numbers
        # so we dont count it when calculating the score
        @player_scores.delete(rolled_value)
        puts "Scores = #{@player_scores}."
        puts "The player last roll (#{rolled_value}), has been removed from the list of scores."
        puts "Player #{@current_player.name} has #{@current_player.dice_count} dices left"
    end
    # method for the game logic
    def execute_game(sides, dice_count, player_count)
        
        # loop for the players (till there are no players left)
        loop do
            # No player left (then break the loop)
            if(player_count == 0)
                break
            end
            (1..player_count).each {|player_id| 
                @current_player = @player_manager.players_list[player_id-1]
                # check if player has no dice left
                if(@current_player.dice_count == 0)
                    # player is dead. This player has no dice left, and thus removed from the game.
                    player_count = player_count -1
                    next
                end 
                puts "\nPlayer #{@current_player.name}:"
                puts "---------"

                # loop for dice (till the player rolls a 2 or a 5)
                loop do
                    # Roll the dice
                    dice = Dice.new()
                    rolled_value = dice.roll(@prng,sides)
                    # compute the players score.
                    @total = @current_player.compute_score(@player_scores); 
                    @player_scores << rolled_value

                    # Rolled 2 or 5 (then break the loop)
                    if rolled_value == 2 || rolled_value == 5
                        rolled_two_or_five(rolled_value)
                        break
                    end 
                end
                update_total()
            }
        end
    end  
end


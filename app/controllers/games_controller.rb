require 'AutoDropDead'
require 'Player'
require 'PlayerManager'
require 'GameManager'
require 'GameLogic'
require 'Dice'

# app/controllers/game_controller.rb
class GamesController < ApplicationController
  def play
    @players = params[:players].to_i
    @sides = params[:sides].to_i
    @dice_count = params[:dice_count].to_i
  end

  def run_game
    # Process the form data to run the AutoDropDead game
    sides = params[:sides].to_i
    dice_count = params[:dice_count].to_i
    player_count = params[:player_count].to_i

    session[:last_players] = player_count
    session[:last_sides] = sides
    session[:last_dice_count] = dice_count

    # Create a temporary file to capture the printed output
    temp_file = Tempfile.new('game_output')

    # Redirect the standard output to the temporary file
    $stdout = temp_file

    # Call AutoDropDead and run the game
    auto_drop_dead = AutoDropDead.new
    auto_drop_dead.play_game(sides, dice_count, player_count)

    # Close the temporary file to ensure it's saved
    temp_file.close
    
    # Read the captured output from the temporary file
    @game_results = File.read(temp_file.path)

    # Save the game results to a file (or database) and store the filename (or record ID) in the session
    result_file = Tempfile.new('game_results')
    result_file.write(@game_results)
    result_file.close
    session[:game_results_file] = result_file.path

    # Restore the original standard output
    $stdout = STDOUT

    # Clean up the temporary file
    temp_file.unlink

    redirect_to results_path
  end
  def results

    # Retrieve the file path from the session
    result_file_path = session[:game_results_file]

    if result_file_path.present? && File.exist?(result_file_path)
      # Read the game results from the file
      @game_results = File.read(result_file_path)
    else
      @game_results = 'No game results available.'
    end
      # Retrieve the last used players, sides, and dice count
      @last_players = session[:last_players]
      @last_sides = session[:last_sides]
      @last_dice_count = session[:last_dice_count]
  end
  
  def play_again
    # Extract the parameters for the new game from the query string
    players = params[:players].to_i
    sides = params[:sides].to_i
    dice_count = params[:dice_count].to_i

    # Create a temporary file to capture the printed output
    temp_file = Tempfile.new('game_output')

    # Redirect the standard output to the temporary file
    $stdout = temp_file

    # Call AutoDropDead and run the game
    auto_drop_dead = AutoDropDead.new
    auto_drop_dead.play_game(sides, dice_count,players)

    # Close the temporary file to ensure it's saved
    temp_file.close

    # Read the captured output from the temporary file
    @game_results = File.read(temp_file.path)

    # Restore the original standard output
    $stdout = STDOUT

    # Clean up the temporary file
    temp_file.unlink

    redirect_to results_path
  end

end

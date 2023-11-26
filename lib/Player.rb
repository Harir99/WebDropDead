class Player 
  attr_reader :name
  attr_accessor :total_score, :dice_count
  dice = Dice.new()
  
  def initialize(name, dice_count)
    @name = name
    @total_score = 0
    @dice_count = dice_count.to_i
  end

  def compute_score(list)
      return list.sum
  end
end


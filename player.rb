class Player
  attr_reader :name, :score, :is_alive
  attr_accessor :games_won, :games_lost

  def initialize(name)
    @name = name
    @score = 3
    @is_alive = true
    @games_won = 0
    @games_lost = 0
  end

  # change the state of score and is_alive
  def reduce_lives()
    @score -= 1

    if @score == 0
      @is_alive = false
    end
  end
end

# player = Player.new('Bob')
# player.reduce_lives()
# puts player.score
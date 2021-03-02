require './player.rb'
require './question.rb'

class Game
  attr_reader :player1, :player2, :question

  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @question = Question.new()
    @player_turn = @player1
    @is_terminal = false
  end

  def run()
    while is_terminal == false
      play()
      display_score()
      switch_turn()
    end

    display_result()
  end

  def play()
    display_question()
    player_answer = gets.chomp().to_i

    if @question.verify_answer(player_answer) == false
      puts @player_turn.name + ": Seriously? NO!"
      @player_turn.reduce_lives()
    else
      puts @player_turn.name + ": YES! You are correct!"
    end
  end

  def display_question()
    question = @question.generate_question
    puts ""
    puts "----- NEW TURN -----"
    if @player_turn == @player1
      puts @player_turn.name + ": " + question
    else
      puts @player_turn.name + ": " + question
    end
  end

  def display_score()
    puts "#{@player1.name}: #{@player1.score}/3 vs #{@player2.name}: #{@player2.score}/3"
  end

  def display_result()
    puts ""

    if @player1.is_alive
      puts "#{@player1.name} wins with a score of #{@player1.score}!"
    else
      puts "#{@player2.name} wins with a score of #{@player2.score}!"
    end

    puts ""
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end

  def switch_turn()
    if @player_turn == @player1
      @player_turn = @player2
    else
      @player_turn = @player1
    end
  end

  def is_terminal()
    # games_won and games_lost only work while the program still runs
    if @player1.is_alive == false
      @player1.games_lost += 1
      @player2.games_won += 1
    elsif @player2.is_alive == false
      @player2.games_lost += 1
      @player1.games_won += 1
    else
      return false
    end
    return true
  end

end

game = Game.new()
game.run()
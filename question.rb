class Question
  attr_reader :name, :answer, :is_correct
  def initialize()
    @name = ''
    @answer = 0
  end

  # generate both question and answer
  def generate_question()
    num1 = rand(1..30)
    num2 = rand(1..30)
    @answer = num1 + num2
    @name = "What does #{num1} plus #{num2} equal?"
  end

  def verify_answer(player_answer)
    return true if player_answer == @answer
    return false
  end
end

# question = Question.new()
# question.generate_question()
# puts question.name
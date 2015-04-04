class GameInterface
  def initialize(guess_elements, code_length)
    @guess_elements = guess_elements
    @code_length = code_length
  end

  def display_instructions
    puts "The name of the game is Mastermind."
    puts "You must think of a #{@code_length}-element-long code derived from the following \
elements: #{@guess_elements}"
    puts "When asked, you will enter that code, and then the computer will make several \
attempts to guess it. You will be asked to provide feedback on each guess, identifying the \
number of matches, close elements, and misses."
    puts "A 'match' is an element in a guess that exists in your code and is in the correct \
position."
    puts "A 'close' element exists in your code, but in a different position than where it \
occurs in the guess."
    puts "A 'miss' is an element in a guess that does not occur in your code."
    puts "Note that for there to be multiple 'close' elements of the same kind, there must \
be an equivalent number of that type of element in the code, otherwise each extra should be \
counted as a 'miss'."
    puts "eg: A code of 'blue foo foo foo' and a guess of 'bar blue blue blue' would yeild \
only one 'close'. Each of the remaining elements count as a 'miss'."
  end

  def solicit_code
    puts "Please enter your code, like so: '1st_element 2nd_element ... nth_element'"

    input = STDIN.gets.strip
    input.split(" ").map{ |c| c.to_sym }
  end

  def display_guess(guess)
    puts guess.reduce("Guess:"){ |str, element| str += " " + element.to_s }
  end

  def solicit_feedback
    puts "Please input feedback on the most recent guess."
    puts "For example, if a guess had 1 match, 3 close, 0 misses, you should type '1 3 0'"

    input = STDIN.gets.strip
    labels = [:match, :close, :miss]
    Hash[labels.zip(input.split(" ").map{ |c| c.to_i })]
  end

  def display_code_maker_won
    puts "Your code wasn't guessed, so you win!" 
  end

  def display_code_maker_lost
    puts "Your code was guessed, so you lose! There's always next time." 
  end
end
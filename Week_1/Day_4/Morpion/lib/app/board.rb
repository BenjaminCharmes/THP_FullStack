class Board
  attr_accessor :array_of_boardcase, :count_turn

  def initialize
    # Initialize the board with the 9 cases (with each " " default value) and start to count turn.
    @array_of_boardcase = BoardCase.new
    @count_turn = 0
  end

  def get_boardcase
    # Return the array to get every case
    return @array_of_boardcase
  end 

  def display_board
    # Print the board
    puts
    puts "          A   B   C ".green
    puts
    #line 1
    print "          #{array_of_boardcase.case['A1']} "
    print "|".green
    print " #{array_of_boardcase.case['B1']} "
    print "|".green
    print " #{array_of_boardcase.case['C1']} "
    puts "   1 ".green
    puts '         ---+---+---'.colorize(:green)
    #line 2
    print "          #{array_of_boardcase.case['A2']} "
    print "|".green
    print " #{array_of_boardcase.case['B2']} "
    print "|".green
    print " #{array_of_boardcase.case['C2']} "
    puts "   2 ".green
    puts '         ---+---+---'.colorize(:green)
    #line 3
    print "          #{array_of_boardcase.case['A3']} "
    print "|".green
    print " #{array_of_boardcase.case['B3']} "
    print "|".green
    print " #{array_of_boardcase.case['C3']} "
    puts "   3 ".green
    puts
  end

  def update_case(choice, player)
    # Update the board with player's choice
    array_of_boardcase.case[choice.capitalize] = player.symbol
  end


end
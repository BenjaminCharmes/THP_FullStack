require_relative "../views/application"

class Game
  attr_accessor :board, :turn

  def initialize
    # Initialize a game on turn 1 with a new board
    @turn = 1
    @board = Board.new
  end


  def play_a_round(player)
    # Player play a round and make a choice, if can't play here, ask to play again. Then turn +1.
    system 'clear'
    puts
    puts "Tour: #{@turn}".red
    @board.display_board
    puts "It's now the turn of #{player.symbol} #{player.name} #{player.symbol} !"
    puts
    puts "Where do you want to play ?"
    print "🖍  > "
    choice = gets.chomp
    while choice.capitalize != "A1" && choice.capitalize != "A2" && choice.capitalize != "A3" && choice.capitalize != "B1" && choice.capitalize != "B2" && choice.capitalize != "B3" && choice.capitalize != "C1" && choice.capitalize != "C2" && choice.capitalize != "C3" 
      system 'clear'
      puts
      puts "Tour: #{@turn}".red
      @board.display_board
      puts
      puts "You can't play here 😒 ! Try again #{player.symbol} #{player.name} #{player.symbol}."
      print "🖍  > "
      choice = gets.chomp
    end
    while board.get_boardcase.case[choice.capitalize] != " "
      system 'clear'
      puts
      puts "Tour: #{@turn}".red
      @board.display_board
      puts
      puts "You can't play here 😒 ! Try again #{player.symbol} #{player.name} #{player.symbol}."
      print "🖍  > "
      choice = gets.chomp
    end

    board.update_case(choice, player)
    system 'clear'
    puts
    @board.display_board
    @turn += 1
  end

  def is_x_win?
    # Return true if player x validates one of eight ways to win
    x = "x".red
      if board.get_boardcase.case['A1'] == x && board.get_boardcase.case['A2'] == x && board.get_boardcase.case['A3'] == x
        return true
      elsif board.get_boardcase.case['B1'] == x && board.get_boardcase.case['B2'] == x && board.get_boardcase.case['B3'] == x 
        return true
      elsif board.get_boardcase.case['C1'] == x && board.get_boardcase.case['C2'] == x && board.get_boardcase.case['C3'] == x 
        return true
      elsif board.get_boardcase.case['A1'] == x && board.get_boardcase.case['B1'] == x && board.get_boardcase.case['C1'] == x
        return true
      elsif board.get_boardcase.case['A2'] == x && board.get_boardcase.case['B2'] == x && board.get_boardcase.case['C2'] == x
        return true
      elsif board.get_boardcase.case['A3'] == x && board.get_boardcase.case['B3'] == x && board.get_boardcase.case['C3'] == x
        return true
      elsif board.get_boardcase.case['A1'] == x && board.get_boardcase.case['B2'] == x && board.get_boardcase.case['C3'] == x
        return true
      elsif board.get_boardcase.case['A3'] == x && board.get_boardcase.case['B2'] == x && board.get_boardcase.case['C1'] == x
        return true
      else
        return false
      end
  end

  def is_o_win?
        # Return true if player o validates one of eight ways to win
    o = "o".blue
    if board.get_boardcase.case['A1'] == o && board.get_boardcase.case['A2'] == o && board.get_boardcase.case['A3'] == o
      return true
    elsif board.get_boardcase.case['B1'] == o && board.get_boardcase.case['B2'] == o && board.get_boardcase.case['B3'] == o
      return true
    elsif board.get_boardcase.case['C1'] == o && board.get_boardcase.case['C2'] == o && board.get_boardcase.case['C3'] == o
      return true
    elsif board.get_boardcase.case['A1'] == o && board.get_boardcase.case['B1'] == o && board.get_boardcase.case['C1'] == o
      return true
    elsif board.get_boardcase.case['A2'] == o && board.get_boardcase.case['B2'] == o && board.get_boardcase.case['C2'] == o
      return true
    elsif board.get_boardcase.case['A3'] == o && board.get_boardcase.case['B3'] == o && board.get_boardcase.case['C3'] == o
      return true
    elsif board.get_boardcase.case['A1'] == o && board.get_boardcase.case['B2'] == o && board.get_boardcase.case['C3'] == o
      return true
    elsif board.get_boardcase.case['A3'] == o && board.get_boardcase.case['B2'] == o && board.get_boardcase.case['C1'] == o
      return true
    else 
      return  false
    end
  end 

  def is_board_full?
    # Return true if there is no more space on board
    if board.get_boardcase.case['A1'] != " " && board.get_boardcase.case['A2'] != " " && board.get_boardcase.case['A3'] != " " && board.get_boardcase.case['B1'] != " " && board.get_boardcase.case['B2'] != " " && board.get_boardcase.case['B3'] != " " && board.get_boardcase.case['C1'] != " " && board.get_boardcase.case['C2'] != " " && board.get_boardcase.case['C3'] != " "
      return true
    else
      return false
    end
  end

  def is_game_draw?
    # Return true if the game is over and no one has won
    if is_o_win? == false && is_x_win? == false && is_board_full? == true
      return true
    end
  end

  def is_game_over?
    # Return true if the game is over
    if is_o_win? == true || is_x_win? == true || is_game_draw? == true
      return true
    else
      return false
    end
  end

end
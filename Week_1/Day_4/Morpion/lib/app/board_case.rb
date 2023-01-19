class BoardCase
  attr_accessor :case

  def initialize
    # Initialize 9 cases with ' ' in default value
    @case = {'A1'=> ' ', 'A2'=> ' ', 'A3'=> ' ', 'B1'=> ' ', 'B2'=> ' ', 'B3'=> ' ', 'C1'=> ' ', 'C2'=>' ', 'C3'=> ' '}
  end

end
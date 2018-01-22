class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
     @sequence_length = 1
     @game_over = false
     @seq = []
   end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    puts "enter the sequence"
    self.seq.each do |color|
      input = gets.chomp
      if color[0] != input
        self.game_over = true
      end
    end 
  end

  def add_random_color
    seq << COLORS.shuffle[0]

  end

  def round_success_message
    puts "correct. Here comes the next one."
  end

  def game_over_message
    puts "Game over :( Your record is #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    self.seq = []
  end
end

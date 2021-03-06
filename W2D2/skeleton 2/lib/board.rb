class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
        4.times do
          cup << :stones
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_number = start_pos

    until stones.length == 0
      cup_number += 1
      cup_number = 0 if cup_number  > 13

      if cup_number == 6 && current_player.name == @name1
        cups[6] << stones.pop
      elsif cup_number == 13 && current_player.name == @name2
        cups[13] << stones.pop
      else
        cup[cup_number] << stones.pop
      end
    end
    render
    next_turn(cup_number)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
    if won?
    player1_count = @cups[6].count
    player2_count = @cups[13].count
    return :draw if player1_count == player2_count

    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end

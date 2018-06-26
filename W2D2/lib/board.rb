class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        until cups[idx].length == 4
          cups[idx] << :stone
        end
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless  start_pos.between?(0,13)
      raise ArgumentError.new "Invalid starting cup"
    end
    if cups[start_pos].length == 0
      raise ArgumentError.new "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    return :draw if player1_count == player2_count
    player1_count > player2_count ? @name1 : @name2
  end
end

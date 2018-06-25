class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Now repeat the same sequence!"
    input = gets.chomp
    if input != @seq
      @game_over == true
    end
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    puts "Excellent work! On to the next round."
  end

  def game_over_message
    puts "Game Over. Try again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

class Game
  attr_accessor :turn
  attr_accessor :black
  attr_accessor :white

  def initialize
    @turn = 0
    @slots = Array.new(4) { rand(1..6) }
  end

  def cguess
    @turn += 1
    puts "Turn #{@turn}"
    puts 'Codebreaker, type in a 4 number guess.'
    @guess = gets.chomp.chars.map { |c| c.to_i }
  end

  def feedback
    @black = 0
    @white = 0

    slots_copy = @slots.dup
    guess_copy = @guess.dup

    slots_copy.each_with_index do |val, idx|
      if val == guess_copy[idx]
        @black += 1
        slots_copy[idx] = nil
        guess_copy[idx] = nil
      end
    end

  guess_copy.each do |val|
    if val && slots_copy.include?(val)
      @white += 1
      slots_copy[slots_copy.index(val)] = nil
    end
  end
    puts "Black pegs: #{@black}, White pegs: #{@white}"
  end

  def mwin
    if (@turn >= 12) && (@black != 4)
      puts "It's been 12 turns, Mastermind wins!"
      puts "The code was #{@slots}"
    end
  end

  def cwin
    if @black == 4
      puts 'Codebreaker has guessed the code, they win!'
    end
  end
end
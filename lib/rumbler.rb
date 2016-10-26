require 'ruby-progressbar'
require 'rumbler/shuffle'

# shuffle and progress
module Rumbler
  class << self
    KEYS = ['a', 'b', 'c']
    DEFAULT_AMOUNT = 100

    def play(amount = DEFAULT_AMOUNT)
      shuffle = Shuffle.new(amount, score_board)
      shuffle.rumble
      finish
    end

    def score_board
      @score_board ||= create_score_board
    end

    def create_score_board
      values = Array.new(KEYS.size, 0)
      Hash[KEYS.zip(values)]
    end

    def finish
      winner = score_board.max_by { |_k, v| v }.first
      puts "#{winner} is got a prize!"
    end
  end
end

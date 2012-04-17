require 'progressbar'
require 'rumbler/shuffle'

module Rumbler
  class << self
    def play(amount=100)
      shuffle = Shuffle.new(amount, score_board)
      shuffle.rumble
      finish 
    end

    def score_board
      @score_board ||= create_score_board
    end

    def create_score_board
      keys = <<-EOF.gsub(/^\s*/,'').split("\n")
        Tetuyoko
        Yokoyama
        HogeR
      EOF
      values = Array.new(keys.size, 0)
      Hash[keys.zip(values)]
    end

    def finish
      winner = score_board.max_by {|k,v| v }.first
      puts "#{winner} is got a prize!"
    end
  end
end


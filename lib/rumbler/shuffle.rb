module Rumbler
  class Shuffle
    def initialize(amount, score_board) 
      @amount, @score_board = amount, score_board
      @progs = @score_board.keys.map {|key| ProgressBar.new(key, @amount) }
    end

    def rumble
      @amount.times { up }
      @score_board.each_pair do |key, value|
        active_bar = pbar(key)
        value.times { sleep 0.01; active_bar.inc}
        active_bar.halt
      end
    end

    def up
      @score_board[@score_board.keys.sample] += 1
    end

    def pbar(key)
      @progs.detect {|n| n.title == key }
    end
  end
end


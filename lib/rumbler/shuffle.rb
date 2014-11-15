module Rumbler
  # shuffle and show progressbar
  class Shuffle
    SLEEP_TIME = 0.01

    def initialize(amount, score_board)
      @amount, @score_board = amount, score_board
      @progs = @score_board.keys.map do |key|
        ProgressBar.new(key, @amount)
      end
    end

    def rumble
      @amount.times { score_up }
      @score_board.each_pair do |key, value|
        active_bar = find_pbar(key)
        value.times do
          sleep SLEEP_TIME
          active_bar.inc
        end
        active_bar.halt
      end
    end

    def score_up
      @score_board[@score_board.keys.sample] += 1
    end

    def find_pbar(key)
      @progs.find { |n| n.title == key }
    end
  end
end

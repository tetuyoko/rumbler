module Rumbler
  # shuffle and show progressbar
  class Shuffle
    SLEEP_TIME = 0.01

    def initialize(amount, score_board)
      @amount, @score_board = amount, score_board
      @progs = @score_board.keys.map do |key|
        ProgressBar.create(title: key, total: @amount)
      end
    end

    def rumble
      @amount.times { score_up }
      @score_board.each_pair do |key, value|
        active_bar = find_pbar(key)
        value.times do
          sleep SLEEP_TIME
          active_bar.progress += 1
        end
        active_bar.stop
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

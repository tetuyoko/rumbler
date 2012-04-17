#!/usr/bin/env ruby
require 'progressbar'

amount = 100
keys = <<-EOF.gsub(/^\s*/,'').split("\n")
  Tetuyoko
  Yokoyama
  HogeR
EOF

values = Array.new(keys.size, 0)
score_board = Hash[keys.zip(values)]

amount.times { score_board[keys.sample] += 1 }

@progs = keys.map {|key| ProgressBar.new(key, amount) }

def pbar(key)
  @progs.detect {|n| n.title == key }
end

score_board.each_pair do |key, value|
  active_bar = pbar(key)
  value.times { sleep 0.01; active_bar.inc}
  active_bar.halt
end

winner = score_board.max_by {|k,v| v }.first
puts "#{winner} is got a prize!"

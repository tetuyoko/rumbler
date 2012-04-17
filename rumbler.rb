require 'progressbar'

pbar = ProgressBar.new('test', 100)
100.times { sleep 0.01; pbar.inc}

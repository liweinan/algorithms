buckets = [30, 32, 36, 38, 40, 62]
sold_at_morning = buckets.combination(2).to_a

arr = []
for x in sold_at_morning
  left = buckets - x
  sold_at_afternoon = left.combination(3).to_a
  sum_morning = x.inject(0) { |sum, _x| sum + _x }
  for y in sold_at_afternoon
    sum_afternoon = y.inject(0) { |sum, _y| sum + _y }
    if sum_afternoon.to_f / sum_morning == 2
      puts "morning: #{x} / afternoon: #{y} / red wine: #{buckets - x - y}"
      exit
    end
  end
end

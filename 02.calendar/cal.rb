#!/usr/bin/env ruby
require 'optparse'
require 'Date'

options = ARGV.getopts('m:', 'y:')
if options["m"]
  month = options["m"].to_i
else
  month = Date.today.month
end
if options["y"]
  year = options["y"].to_i
else
  year = Date.today.year
end

day = Date.new(year,month,1)
last_day = Date.new(year,month,-1)

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"
print (' ' * (day.wday * 3 - 1 )) unless day.sunday?

while day <= last_day do
  print day.day.to_s.rjust(day.sunday? ? 2 : 3)
  puts "" if day.saturday?
  day = day + 1
end
puts ""

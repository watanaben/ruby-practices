#!/usr/bin/env ruby

=begin
-mで月を、-yで年を指定できる
  ただし、-yのみ指定して一年分のカレンダーを表示する機能の実装は不要
引数を指定しない場合は、今月・今年のカレンダーが表示される
macに入っているcalコマンドと同じ見た目になっている
少なくとも1970年から2100年までは正しく表示される
=end

require 'optparse'
require 'Date'

# 引数を受け取り、月・年を設定
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

# 月の初日と最終日を設定
day = Date.new(year,month,1)
last_day = Date.new(year,month,-1)

# ヘッダ部分のプリント
puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"

# 初日のプリント
print (' ' * (day.wday * 2 + 1)) unless day.sunday?

# 2日以降のプリント
while day <= last_day do
  print day.day.to_s.rjust(day.sunday? ? 2 : 3)
  puts "" if day.saturday?
  day = day + 1
end
puts ""

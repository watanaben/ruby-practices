#!/usr/bin/env ruby

# 1から20までの数に対し、次のルールでプリント
# - 3と５の倍数(15,30...)のときは、FizzBuzz 
# - 3の倍数(3,6,9...)のときは、Fizz
# - 5の倍数(5,10...)のときは、Buzz
# - 上記以外は、数字をそのまま

(1..20).each do |n|
  case 
  # 3と５の倍数(15,30...)のときは、FizzBuzz  
  when n % 15 == 0
    puts "FizzBuzz"
  # 3の倍数(3,6,9...)のときは、Fizz
  when n % 3 == 0
    puts "Fizz"
  # 5の倍数(5,10...)のときは、Buzz
  when n % 5 == 0
    puts "Buzz"
  # 上記以外は、数字をそのまま  
  else
    puts n
  end
end

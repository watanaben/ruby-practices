#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 'x'
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

if frames[10]
  if frames[11]
    frames[9] += frames[10] + frames[11]
    frames.delete_at(11)
  else
    frames[9] += frames[10]
  end
  frames.delete_at(10)
end
frames[9].delete_if { |x| x == 'x' }
frames = frames.map do |frame|
  frame.delete_at(1) if frame[1] == 'x'
  frame
end

point = 0
frames.each_with_index do |frame, i|
  case i
  when 0..7
    if frame[0] == 10
      point += 10 + frames[i + 1][0]
      point += frames[i + 1][1] || frames[i + 2][0]
    elsif frame.sum == 10
      point += 10 + frames[i + 1][0]
    else
      point += frame.sum
    end
  when 8
    point = if frame[0] == 10
              point + 10 + frames[9][0] + frames[9][1]
            elsif frame.sum == 10
              point + 10 + frames[9][0]
            else
              point + frame.sum
            end
  when 9
    point += frame.sum
  end
end
puts point

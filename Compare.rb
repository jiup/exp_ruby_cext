require_relative 'CFixedArray'
require_relative 'RubyFixedArray'
include CFixedArray

# CFixedArray
timestamp = Time.now
c_array = CFixedArray.new(1_000_000, 253)
p c_array.length
p c_array.sum
puts "T=#{(Time.now - timestamp)}\n\n" # T=0.002234

# RubyFixedArray
timestamp = Time.now
ruby_array = RubyFixedArray.new(1_000_000, 253)
p ruby_array.length
p ruby_array.sum
puts "T=#{(Time.now - timestamp)}\n\n" # T=0.056543
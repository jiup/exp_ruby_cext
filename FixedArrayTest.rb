require 'minitest/autorun'
require_relative 'CFixedArray'
require_relative 'RubyFixedArray'

include CFixedArray

class FixedArrayTest < Minitest::Test
  def test_new
    arr = []
    CFixedArray.new(3).each { |e| arr << e }
    assert_equal arr, [0, 0, 0]

    arr.clear
    RubyFixedArray.new(3).each { |e| arr << e }
    assert_equal arr, [0, 0, 0]
  end

  def test_new_with_val
    arr = []
    CFixedArray.new(3, 9).each { |e| arr << e }
    assert_equal arr, [9, 9, 9]

    arr.clear
    RubyFixedArray.new(3, 9).each { |e| arr << e }
    assert_equal arr, [9, 9, 9]
  end

  def test_length
    arr = CFixedArray.new(3)
    assert_equal 3, arr.length

    arr = RubyFixedArray.new(3)
    assert_equal 3, arr.length
  end

  def test_each
    arr = CFixedArray.new(3, 9)
    arr.each do |e|
      assert_equal 9, e
    end

    arr = RubyFixedArray.new(3, 9)
    arr.each do |e|
      assert_equal 9, e
    end
  end

  def test_sum
    arr = CFixedArray.new(3, 9)
    assert_equal 27, arr.sum

    arr = RubyFixedArray.new(3, 9)
    assert_equal 27, arr.sum
  end
end
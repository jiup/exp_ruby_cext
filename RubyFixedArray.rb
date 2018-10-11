class RubyFixedArray
  def initialize(length, default = 0)
    @array = Array.new(length)
    @array.fill(default)
    self
  end

  def length
    @array.length
  end

  def set(index, value)
    @array[index] = value
  end

  def each(&block)
    @array.each(&block)
  end

  def sum
    s = 0
    (0...length).each { |i| s += @array[i] }
    s
  end
end
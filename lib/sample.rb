class GridPoint

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    return "(#{x},#{y})"
  end

  def ==(val)
    return x == val.x && y == val.y
  end

  def neighbor_of?(val)
    if x == val.x
      return y == val.y - 1 || y == val.y + 1
    elsif y == val.y
      return x == val.x - 1 || x == val.x + 1
    end
    return false
  end
end

class GridPoints
  class SamePointError < ArgumentError
  end

  def initialize(a, b)
    @points = [a, b]
    raise SamePointError if a == b
  end

  def contain?(val)
    return @points.include?(val)
  end
end


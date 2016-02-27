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

  # XXX: いらない？
  def eql?(val)
    self == val
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
  class TooManyArgumentError < ArgumentError
  end

  MAX_POINTS = 3

  def initialize(*points)
    @points = points
    raise ArgumentError if points.size == 1
    raise TooManyArgumentError if points.size > MAX_POINTS
    raise SamePointError unless points.size == points.uniq{|p|p.to_s}.size
  end

  def contain?(val)
    return @points.include?(val)
  end

  def connected?
    @points.all? do |point|
      @points.any? { |p| p.neighbor_of?(point) }
    end
  end
end


class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_triangle
  end

  def kind
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    valid_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each { |s| valid_triangle << false if s <= 0 }
    raise TriangleError if valid_triangle.include?(false)
  end

  class TriangleError < StandardError
  end
end

# tests
triangle1 = Triangle.new(3, 3, 3)  # equilateral triangle
puts triangle1.kind  # => :equilateral

triangle2 = Triangle.new(3, 4, 4)  # isosceles triangle
puts triangle2.kind  # => :isosceles

triangle3 = Triangle.new(3, 4, 5)  # scalene triangle
puts triangle3.kind  # => :scalene
require "test_helper"
require "test_driven_development_by_example/dollar"

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Dollar.new 5
    product = five.times 2
    assert_equal 10, product.amount
    product = five.times 3
    assert_equal 15, product.amount
  end

  def test_equality
    assert_equal(true, Dollar.new(5) == Dollar.new(5))
    assert_equal(false, Dollar.new(5) == Dollar.new(6))
  end
end

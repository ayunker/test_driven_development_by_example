require "test_helper"
require "test_driven_development_by_example/money"
require "test_driven_development_by_example/bank"

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Money.dollar 5
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_franc_multiplication
    five = Money.franc 5
    assert_equal Money.franc(10), five.times(2)
    assert_equal Money.franc(15), five.times(3)
  end

  def test_equality
    assert_equal(true, Money.dollar(5) == Money.dollar(5))
    assert_equal(false, Money.dollar(5) == Money.dollar(6))

    assert_equal(false, Money.franc(5) == Money.dollar(5))
  end

  def test_currency
    assert_equal 'CHF', Money.franc(1).currency
    assert_equal 'USD', Money.dollar(1).currency
  end

  def test_reduce_sum
    sum = Sum.new Money.dollar(3), Money.dollar(4)
    bank = Bank.new
    result = bank.reduce sum, 'USD'
    assert_equal Money.dollar(7), result
  end

  def test_plus_returns_sum
    five = Money.dollar 5
    sum = five.plus five
    assert_equal five, sum.augend
    assert_equal five, sum.addend
  end

  def test_identity_rate
    assert_equal 1, Bank.new.rate('USD', 'USD')
  end

  def test_reduce_money
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    assert_equal Money.dollar(1), result
  end

  def test_reduce_money_different_currency
    bank = Bank.new
    bank.add_rate 'CHF', 'USD', 2
    result = bank.reduce(Money.franc(2), 'USD')
    assert_equal Money.dollar(1), result
  end

  def test_mixed_addition
    fiveBucks = Money.dollar 5
    tenFrancs = Money.franc 10
    bank = Bank.new
    bank.add_rate 'CHF', 'USD', 2
    sum = fiveBucks.plus(tenFrancs)
    result = bank.reduce(sum, 'USD')
    assert_equal Money.dollar(10), result
  end

  def test_sum_times
    fiveBucks = Money.dollar 5
    tenFrancs = Money.franc 10
    bank = Bank.new
    bank.add_rate 'CHF', 'USD', 2
    sum = Sum.new(fiveBucks, tenFrancs).times(2)
    result = bank.reduce sum, 'USD'
    assert_equal Money.dollar(20), result
  end
end

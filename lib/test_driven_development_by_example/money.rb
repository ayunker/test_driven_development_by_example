require 'test_driven_development_by_example/expression'

class Money
  include Expression

  attr_reader :amount, :currency

  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def == other_item
    @amount == other_item.amount && other_item.currency == self.currency
  end

  def currency
    @currency
  end

  def times mult
    Money.new(amount * mult, currency)
  end

  def plus addend
    Money.new(amount + addend.amount, currency)
  end

  def self.dollar amount
    Money.new amount, 'USD'
  end

  def self.franc amount
    Money.new amount, 'CHF'
  end
end


require 'test_driven_development_by_example/expression'
require 'test_driven_development_by_example/sum'

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
    return Sum.new self, addend
  end

  def self.dollar amount
    Money.new amount, 'USD'
  end

  def self.franc amount
    Money.new amount, 'CHF'
  end

  def reduce bank, curr_to
    rate = bank.rate currency, curr_to
    Money.new(amount / rate, curr_to)
  end
end


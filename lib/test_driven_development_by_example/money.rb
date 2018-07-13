class Money
  attr_reader :amount, :currency

  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def == other_item
    @amount == other_item.amount && other_item.currency == self.currency
  end

  def times mult
    Money.new(amount * mult, currency)
  end

  def self.dollar amount
    Dollar.new amount, 'USD'
  end

  def self.franc amount
    Franc.new amount, 'CHF'
  end
end

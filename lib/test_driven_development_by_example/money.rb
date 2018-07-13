class Money
  attr_reader :amount, :currency

  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def == other_item
    @amount == other_item.amount && other_item.class.name == self.class.name
  end

  def self.dollar amount
    Dollar.new amount, 'USD'
  end

  def self.franc amount
    Franc.new amount, 'CHF'
  end
end

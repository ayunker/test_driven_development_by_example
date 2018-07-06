class Money
  attr_reader :amount

  def == other_item
    @amount == other_item.amount && other_item.class.name == self.class.name
  end

  def self.dollar amount
    Dollar.new amount
  end

  def self.franc amount
    Franc.new amount
  end
end

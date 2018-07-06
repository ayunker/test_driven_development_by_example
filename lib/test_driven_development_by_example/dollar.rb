class Dollar
  attr_reader :amount

  def initialize amount
    @amount = amount
  end

  def times mult
    Dollar.new(@amount * mult)
  end

  def == other_item
    @amount == other_item.amount
  end
end

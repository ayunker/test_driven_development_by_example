class Franc
  attr_reader :amount

  def initialize amount
    @amount = amount
  end

  def times mult
    Franc.new(@amount * mult)
  end

  def == other_item
    @amount == other_item.amount
  end
end

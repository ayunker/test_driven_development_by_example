class Money
  attr_reader :amount

  def == other_item
    @amount == other_item.amount
  end
end

module Expression
  def plus added
    return Money.new(amount + added.amount, currency)
  end
end

require_relative "money"

class Dollar < Money

  def initialize amount, currency
    super amount, currency
  end

  def times mult
    Money.dollar(amount * mult)
  end
end

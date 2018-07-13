require_relative "money"

class Franc < Money

  def initialize amount, currency
    super amount, currency
  end

  def times mult
    Money.franc(amount * mult)
  end
end

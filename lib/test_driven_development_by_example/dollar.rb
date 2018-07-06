require_relative "money"

class Dollar < Money
  def initialize amount
    @amount = amount
  end

  def times mult
    Dollar.new(@amount * mult)
  end
end

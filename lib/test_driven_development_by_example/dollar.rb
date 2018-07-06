class Dollar
  attr_accessor :amount

  def initialize amount
    @amount = amount
  end

  def times mult
    @amount *= mult
  end
end

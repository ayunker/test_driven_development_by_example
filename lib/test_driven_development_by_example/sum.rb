require 'test_driven_development_by_example/expression'

class Sum
  include Expression

  attr_reader :augend, :addend

  def initialize augend, addend
    @augend = augend
    @addend = addend
  end

  def augend
    @augend
  end

  def addend
    @addend
  end

  def reduce bank, curr_to
    amount = augend.reduce(bank, curr_to).amount + addend.reduce(bank, curr_to).amount
    Money.new amount, curr_to
  end
end

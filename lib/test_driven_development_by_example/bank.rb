require 'test_driven_development_by_example/pair'

class Bank
  attr_reader :rates

  def rates
    @rates ||= {}
  end

  def reduce source, curr_to
    source.reduce self, curr_to
  end

  def add_rate from, to, rate
    rates[Pair.new(from, to)] = rate
  end

  def rate from, to
    return 1 if from == to
    rates[Pair.new(from, to)]
  end
end

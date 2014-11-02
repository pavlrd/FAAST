require_relative 'coach'

class Train

  attr_reader :coaches

  def initialize(amount = 10)
    @coaches = []
    train(amount)
  end

  def add(coach)
    @coaches << coach
  end

  def train(number)
    number.times { @coaches << Coach.new }
  end
end

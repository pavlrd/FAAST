require_relative 'coach'

class Train

  attr_reader :coaches

  def initialize(options = {})
    @coaches = []
    train(options.fetch(:carriages, 10)) # 10, is default amount of coaches
  end

  def add(coach)
    @coaches << coach
  end

  def train(number)
    number.times { @coaches << Coach.new }
  end
end

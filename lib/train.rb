require_relative 'coach'

class Train

  attr_reader :coaches

  DEFAULT_COACHES = 10

  def initialize(options = {})
    @coaches = []
    train(options.fetch(:carriages, DEFAULT_COACHES)) 
  end

  def add(coach)
    coaches << coach
  end

  def train(number)
    number.times { @coaches << Coach.new }
  end
  
end

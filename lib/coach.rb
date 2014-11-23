require_relative 'container'

class Coach
  include Container

  MAX_CAPACITY = 40

  def full?
    passengers.count == MAX_CAPACITY
  end

  def board(passenger)
    raise "Sorry, coach is full, check another one" if full?
    raise "You not in the tube right now, sorry" if !passenger.in_the_tube
    enter(passenger)
  end
end

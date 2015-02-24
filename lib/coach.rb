require_relative 'container'

# this class responsible for handling coach capacity
class Coach
  include Container

  MAX_CAPACITY = 40

  def full?
    passengers.count == MAX_CAPACITY
  end

  def board(passenger)
    fail 'Sorry, coach is full, check another one' if full?
    fail 'You not in the tube right now, sorry' unless passenger.in_the_tube
    enter(passenger)
  end
end

require_relative 'tube_container'

class Coach
  include TubeContainer

  MAX_CAPACITY = 40

  def go_in(passenger, station)
    raise "Sorry, coach is full, check another one" if full?
    station.leave(passenger)
    enter(passenger)
  end

  def full?
    passengers.count == MAX_CAPACITY
  end

  def alight(passenger, station)
    leave(passenger)
    station.enter(passenger)
  end
end

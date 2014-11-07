require_relative 'tube_container'

class Coach
  include TubeContainer

  def initialize
     @capacity = 40
  end

  def go_in(passenger)
    raise "Sorry, coach is full, check another one" if full?
    enter(passenger)
  end

  def full?
    passengers.count == @capacity
  end

  def alight(passenger, station)
    leave(passenger)
    station.enter(passenger)
  end
end
class Coach

  attr_reader :passengers

  def initialize
     @passengers = []
     @capacity = 40
  end

  def enter(passenger)
    raise "Sorry, coach is full, check another one" if full?
    @passengers << passenger
  end

  def full?
    @passengers.count == @capacity
  end

  def alight(passenger)
    @passengers.delete(passenger)
  end
end
class Coach

  attr_reader :passengers

  MAX_CAPACITY = 40

  def initialize
    @passengers = []
  end

  def full?
    @passengers.count == MAX_CAPACITY
  end

  def board(passenger)
    raise "Sorry, coach is full, check another one" if full?
    raise "You not in the tube right now, sorry" if !passenger.in_the_tube
    @passengers << passenger  
  end

  def leave(passenger)
    @passengers.delete(passenger)
  end
end

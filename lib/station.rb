class Station

  attr_reader :train, :passengers
 
  def initialize
    @train = nil
    @passengers = []
  end

  def arrive(train)
    @train = train
  end

  def enter(passenger)
    @passengers << passenger
  end

  def leave(passenger, coach)
    @passengers.delete(passenger)
    coach.enter(passenger)
  end

  def touch_in(passenger)
    raise "There is not enough money on your account" if passenger.account < 2
    @passengers << passenger
  end

  def touch_out(passenger)
    @passengers.delete(passenger)
  end
end
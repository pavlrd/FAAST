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

  def enter_train(passenger, coach)
    leave(passenger)
    coach.enter(passenger)
  end

  def leave(passenger)
    @passengers.delete(passenger)
  end

  def touch_in(passenger)
    raise "There is not enough money on your account" if passenger.account < 2
    enter(passenger)
  end

  def touch_out(passenger)
    leave(passenger)
    passenger.deduct
  end
end
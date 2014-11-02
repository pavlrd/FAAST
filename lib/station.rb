class Station

  attr_reader :train, :passengers

 
  def initialize
    @train = nil
    @passengers = []
  end

  def arrive(train)
    @train = train
  end

  def touch_in(passenger)
    charging_system(passenger)
    @passengers << passenger
  end

  def touch_out(passenger)
    @passengers.delete(passenger)
  end

  def charging_system(passenger)
    raise "There is not enough money on your account" if passenger.account < 2
  end


end
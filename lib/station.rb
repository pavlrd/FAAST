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
    @passengers << passenger
  end

  def touch_out(passenger)
    @passengers.delete(passenger)
  end

end
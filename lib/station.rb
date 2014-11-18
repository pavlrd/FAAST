class Station

  attr_reader :trains, :passengers

  DEFAULT_PLATFORMS = 2

  def initialize(options = {})
    @passengers = []
    @platform_numbers = options.fetch(:platforms, DEFAULT_PLATFORMS)
    @trains = {}
  end

  def arrived_at_platform(train, platform_number)
    raise "Sorry plaform is in use now" if @trains.values.include?(platform_number)
    raise "Platform does not exist!" if platform_number > @platform_numbers 
    @trains[train] = platform_number 
  end

  def release_train(train)
    @trains.delete(train)
  end

  def touch_in(passenger)
    raise "There is not enough money on your account" if passenger.credit < 2
    @passengers << passenger
    passenger.in_the_tube = true
  end

  def touch_out(passenger)
    @passengers.delete(passenger)
    passenger.deduct
    passenger.in_the_tube = false
  end

  def enter(passenger)
    @passengers << passenger
  end

  def leave(passenger)
    @passengers.delete(passenger)
  end
end

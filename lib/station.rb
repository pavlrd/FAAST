require_relative 'container'

class Station
  include Container

  attr_reader :trains

  DEFAULT_PLATFORMS = 2

  def initialize(options = {})
    @platform_numbers = options.fetch(:platforms, DEFAULT_PLATFORMS)
    @trains = {}
  end

  def arrived_at_platform(train, platform_number)
    raise "Sorry plaform is in use now" if @trains.values.include?(platform_number)
    raise "Platform does not exist!" if platform_number > @platform_numbers 
    trains[train] = platform_number 
  end

  def release_train(train)
    trains.delete(train)
  end

  def touch_in(passenger)
    raise "There is not enough money on your account" if passenger.credit < 2
    enter(passenger)
    passenger.in_the_tube = true
  end

  def touch_out(passenger)
    leave(passenger)
    passenger.deduct
    passenger.in_the_tube = false
  end
end

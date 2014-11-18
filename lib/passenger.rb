class Passenger

  attr_reader :credit

  attr_accessor :in_the_tube

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  def initialize(options={})
    @credit = options.fetch(:credit, DEFAULT_CREDIT )
    @in_the_tube = false
  end

  def deduct
    @credit -= TRIP_COST
  end

  def enter(place)
    place.enter(self)
  end

  def leave(place)
    place.leave(self)
  end

end
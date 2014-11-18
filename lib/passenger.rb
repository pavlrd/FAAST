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

  def touch_in(station)
    station.touch_in(self)
  end

  def touch_out(station)
    station.touch_out(self)
  end

  def board(train, coach_number, station)
    raise "Sorry train not yet at the station" if !station.trains.include?(train)
    train[coach_number].board(self) 
    station.leave(self)
  end

  def alight(train, coach_number, station)
    raise "Sorry train not yet at the station" if !station.trains.include?(train)
    train[coach_number].alight(self)
    station.enter(self)
  end

end
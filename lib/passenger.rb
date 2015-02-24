# quite heavy class, with loads of methods related to passenger entering
# and leaving station and train
class Passenger
  attr_reader :credit

  attr_accessor :in_the_tube

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  def initialize(options = {})
    @credit = options.fetch(:credit, DEFAULT_CREDIT)
    @in_the_tube = false # location
  end

  def deduct
    @credit -= TRIP_COST
  end

  def touch_in(station)
    station.touch_in(self)
    self.in_the_tube = true
  end

  def touch_out(station)
    station.touch_out(self)
    self.in_the_tube = false
  end

  def board(train, coach_number, station)
    error_message('board', train, station)
    train[coach_number].board(self)
    station.leave(self)
  end

  def alight(train, coach_number, station)
    error_message('alight', train, station)
    train[coach_number].alight(self)
    station.enter(self)
  end

  private

  def error_message(action, train, station)
    fail "Sorry, you can't #{action} train yet" if station.train_not_at_the_station?(train)
  end
end

require_relative 'tube_container'

class Station
  include TubeContainer

  attr_reader :train

  def initialize
    release_train
  end

  def arrived(train)
    @train = train
  end

  def release_train
    @train = false
  end

  def enter_train(passenger, coach)
    leave(passenger)
    coach.enter(passenger)
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

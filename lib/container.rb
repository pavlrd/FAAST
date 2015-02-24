# similar methods for station and train extracted in container
module Container
  def passengers
    @passengers ||= []
  end

  def enter(passenger)
    passengers << passenger
  end

  def leave(passenger)
    passengers.delete(passenger)
  end
end

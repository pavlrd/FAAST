class Passenger

  attr_reader :account

  def initialize(options={})
    @account = options.fetch(:account, 1)
  end

  def deduct
    @account -= 2
  end

end
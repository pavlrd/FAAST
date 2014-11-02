class Passenger

  attr_accessor :account

  def initialize(options={})
    @account = options.fetch(:account, 1)
  end

end
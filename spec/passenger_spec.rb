require 'passenger'

describe Passenger do

  it 'has default money on account' do
    passenger = Passenger.new
    expect(passenger.account).to eq 1
  end

  it 'can add money to account' do 
    passenger = Passenger.new(account: 20)
    expect(passenger.account).to eq 20
  end
end
require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new(account: 20) }

  it 'has default money on account' do
    passenger = Passenger.new
    expect(passenger.account).to eq 1
  end

  it 'can add money to account' do 
    expect(passenger.account).to eq 20
  end

  it 'allow to deduct money from account' do
    expect { passenger.deduct }.to change { passenger.account }.by -2
  end
end
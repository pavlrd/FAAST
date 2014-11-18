require 'passenger'

describe Passenger do

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  let(:passenger) { Passenger.new   }
  let(:station)   { double :station }
  let(:train)     { double :train   }
 
  it 'has default amount money when initialized' do
    expect(passenger.credit).to eq DEFAULT_CREDIT
  end

  it 'can be initialized with some money on credit' do
    passenger = Passenger.new(credit: 20)
    expect(passenger.credit).to eq 20
  end

  it 'allow to deduct money from credit' do
    expect { passenger.deduct }.to change { passenger.credit }.by -TRIP_COST
  end

  it 'not in the tube when initialized' do
    expect(passenger.in_the_tube).to be false
  end

  it 'can enter station' do
    allow(station).to receive(:enter).with(passenger)
    passenger.enter(station)
  end

  it 'can leave station' do
    allow(station).to receive(:leave).with(passenger)
    passenger.leave(station)
  end

  it 'can enter train if train at the station' do
    allow(train).to receive(:enter).with(passenger)
    passenger.enter(train)
  end

  it 'can leave train if train at the station' do
    allow(train).to receive(:leave).with(passenger)
    passenger.leave(train)
  end
end
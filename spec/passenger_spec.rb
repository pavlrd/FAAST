require 'passenger'

describe Passenger do

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  let(:passenger) { Passenger.new   }
  let(:station)   { double :station }
  let(:coach)     { double :coach   }
 
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

  it 'can enter station' do
    allow(station).to receive(:enter).with(passenger)
    passenger.enter(station)
  end

  it 'can leave station' do
    allow(station).to receive(:leave).with(passenger)
    passenger.leave(station)
  end

  it 'can enter coach if train at the station' do
    allow(coach).to receive(:enter).with(passenger)
    passenger.enter(coach)
  end

  it 'can leave coach if train at the station' do
    allow(coach).to receive(:leave).with(passenger)
    passenger.leave(coach)
  end
end
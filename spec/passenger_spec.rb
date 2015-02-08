require 'spec_helper'
require 'passenger'

describe Passenger do

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  COACH_NUMBER = 0

  let(:passenger) { Passenger.new   }
  let(:station)   { double :station }
  let(:train)     { double [:coach] }
 
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
    allow(station).to receive(:touch_in).with(passenger)
    passenger.touch_in(station)
  end

  it 'can leave station' do
    allow(station).to receive(:touch_out).with(passenger)
    passenger.touch_out(station)
  end

  it 'can enter coach if train at the station' do
    coach = double :coach
    train = [coach, :coach2]
    allow(coach).to receive(:board).with(passenger)
    allow(station).to receive(:train_not_at_the_station?).and_return false
    allow(station).to receive(:leave).with(passenger)
    passenger.board(train, COACH_NUMBER, station )
  end

  it 'can leave coach if train at the station' do
    coach = double :coach
    train = [coach, :coach2]
    allow(coach).to receive(:alight).with(passenger)
    allow(station).to receive(:train_not_at_the_station?).and_return false
    allow(station).to receive(:enter).with(passenger)
    passenger.alight(train, COACH_NUMBER, station)
  end
end
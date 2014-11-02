require 'station'

describe Station do
  
  let(:station)   { Station.new       }
  let(:train)     { double :train     }
  let(:passenger) { double :passenger }

  it 'can hold a train' do 
    expect(station.train).to eq nil
    station.arrive(train)
    expect(station.train).to eq train
  end

  it 'let passengers to touch in to enter station' do
    expect(station.passengers.count). to eq 0
    station.touch_in(passenger)
    expect(station.passengers.count).to eq 1
  end

  it 'let passengers to touch out to leave station' do
    expect(station.passengers.count). to eq 0
    station.touch_in(passenger)
    expect(station.passengers.count).to eq 1
    station.touch_out(passenger)
    expect(station.passengers.count). to eq 0
  end
end
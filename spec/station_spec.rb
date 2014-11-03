require 'station'

describe Station do
  
  let(:station)    { Station.new                    }
  let(:train)      { double :train                  }
  let(:passenger)  { double :passenger, account: 1  }
  let(:passenger2) { double :passenger2, account: 2 }
  let(:coach)      { double :coach                  }

  it 'can hold a train' do 
    expect(station.train).to eq nil
    station.arrive(train)
    expect(station.train).to eq train
  end

  it 'let passengers to touch in to enter station' do
    expect(station.passengers.count). to eq 0
    station.touch_in(passenger2)
    expect(station.passengers.count).to eq 1
  end

  it 'let passengers to touch out to leave station' do
    expect(station.passengers.count). to eq 0
    station.touch_in(passenger2)
    expect(station.passengers.count).to eq 1
    station.touch_out(passenger2)
    expect(station.passengers.count). to eq 0
  end

  it 'let passengers to move from train to station' do
    expect(coach).to receive(:enter).with(passenger2)
    coach.enter(passenger2)
    expect(coach).to receive(:alight).with(passenger2, station)
    coach.alight(passenger2, station)
    station.enter(passenger)
    expect(station.passengers.count).to eq 1
  end

  it 'let passenger to move from station to train' do
    station.touch_in(passenger2)
    expect(station.passengers.count).to eq 1
    expect(coach).to receive(:enter)
    station.leave(passenger2, coach)
    expect(station.passengers.count).to eq 0
  end 

  context 'charging system' do
    it 'checks if there enough money passenger has while touching in' do 
      expect{station.touch_in(passenger)}.to raise_error RuntimeError
    end

    it 'do not let to get in to station if not enough money' do
      expect{station.touch_in(passenger)}.to raise_error RuntimeError
    end
  end
end
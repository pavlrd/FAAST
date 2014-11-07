require 'station'

describe Station do
  
  let(:station)    { Station.new                    }
  let(:train)      { double :train                  }
  let(:passenger)  { double :passenger, account: 1  }
  let(:passenger2) { double :passenger2, account: 2 }
  let(:coach)      { double :coach                  }

  it 'can hold a train' do 
    expect(station.train).to eq false
    station.arrive(train)
    expect(station.train).to eq train
  end

  it 'let passengers to enter station' do
    expect(station.passengers.count). to eq 0
    expect { station.touch_in(passenger2) }.to change { station.passengers.count }.by 1
  end

  it 'let passengers to leave station' do
    station.touch_in(passenger2)
    expect(passenger2).to receive(:deduct)
    expect { station.touch_out(passenger2) }.to change { station.passengers.count }.by -1
  end

  it 'let passenger to move from station to train' do
    expect { station.touch_in(passenger2) }.to change { station.passengers.count }.by 1
    expect(coach).to receive(:enter)
    expect { station.enter_train(passenger2, coach) }.to change { station.passengers.count }.by -1
  end 

  context 'charging system work with passenger account' do

    it 'do not let to get in to station if not enough money' do
      expect{station.touch_in(passenger)}.to raise_error RuntimeError
    end

    it 'let to get in if account has enough money' do
      expect { station.touch_in(passenger2) }.to change { station.passengers.count }.by 1
    end

    it 'deduct money when customer leaves the station' do
      expect(passenger2).to receive(:deduct)
      station.touch_out(passenger2)
    end
  end
end
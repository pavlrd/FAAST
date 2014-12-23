require 'station'
require_relative 'container_shared_examples'

describe Station do

  it_behaves_like "container"

  let(:station)    { Station.new                    }
  let(:train)      { double :train                  }
  let(:passenger)  { double :passenger, credit: 1   }
  let(:passenger2) { double :passenger2, credit: 2  }
  let(:coach)      { double :coach                  }

  PLATFORM_NUMBER = 1

  it 'leet train to arrive' do
    expect(station.trains.count).to eq 0
    station.arrived_at_platform(train, PLATFORM_NUMBER)
    expect(station.trains.count).to eq 1
  end

  it 'let train to depart' do
    station.arrived_at_platform(train, PLATFORM_NUMBER)
    expect { station.release_train(train) }.to change { station.trains.count }.by -1
  end

  it 'let passengers to enter station' do
    expect(station.passengers.count). to eq 0
    allow(passenger2).to receive(:in_the_tube=).with(true)
    expect { station.touch_in(passenger2) }.to change { station.passengers.count }.by 1
  end

  it 'let passengers to leave station' do
    allow(passenger2).to receive(:in_the_tube=).with(true)
    station.touch_in(passenger2)
    expect(passenger2).to receive(:deduct)
    allow(passenger2).to receive(:in_the_tube=).with(false)
    expect { station.touch_out(passenger2) }.to change { station.passengers.count }.by -1
  end

  context 'station charging system work with passengers credit' do

    it 'do not let to get in to station if not enough money' do
      expect{station.touch_in(passenger)}.to raise_error RuntimeError
    end

    it 'let to get in if account has enough money' do
      allow(passenger2).to receive(:in_the_tube=).with(true)
      expect { station.enter(passenger2) }.to change { station.passengers.count }.by 1
    end

    it 'deduct money when customer leaves the station' do
      expect(passenger2).to receive(:deduct)
      allow(passenger2).to receive(:in_the_tube=).with(false)
      station.touch_out(passenger2)
    end
  end
end


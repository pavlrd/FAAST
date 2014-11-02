require 'Train'

describe Train do

  let(:train) { Train.new     }
  let(:coach) { double :coach }

  it 'has default amount of carriages' do
    expect(train.coaches.count).to eq 10
  end

  it 'can add another carriage' do
    expect(train.coaches.count).to eq 10
    train.add(coach)
    expect(train.coaches.count).to eq 11
  end
end
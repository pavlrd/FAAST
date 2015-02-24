require 'spec_helper'
require 'train'

describe Train do
  DEFAULT_AMOUNT_COACHES = 10

  let(:train)     { Train.new         }
  let(:coach)     { double :coach     }
  let(:station)   { double :station   }
  let(:passenger) { double :passenger }

  it 'has default amount of carriages' do
    expect(train.coaches.count).to eq DEFAULT_AMOUNT_COACHES
  end

  it 'can add another carriage' do
    train.add(coach)
    expect(train.coaches.count).to eq 11
  end
end

require 'rails_helper'

RSpec.describe PokerHand, type: :model do
  describe '.cache' do
    let(:cache) do
      ActiveSupport::Cache::MemoryStore.new
    end

    describe 'when writing to the cache' do
      before do
        allow(Rails).to receive(:cache).and_return(cache)
        allow(cache).to receive(:write).and_call_original
      end
      it 'persists the hand to the cache' do
        subject = PokerHand.cache(1, 'AS')
        expect(cache).to have_received(:write).with("hand:#{1}", ['AS'])
        expect(subject.attributes).to eq(PokerHand.new(cards: ['AS']).attributes)
      end
    end

    describe 'when reading the cache' do
      before do
        allow(Rails).to receive(:cache).and_return(cache)
        allow(cache).to receive(:write).and_call_original
      end
      it 'persists the hand to the cache' do
        PokerHand.cache(1, 'AS')
        subject = PokerHand.cache(1)
        expect(subject.attributes).to eq(PokerHand.new(cards: ['AS']).attributes)
      end
    end
  end
end


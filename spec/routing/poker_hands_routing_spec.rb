require 'rails_helper'

RSpec.describe PokerHandsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/poker_hands').to route_to('poker_hands#index')
    end

    it 'routes to #new' do
      expect(get: '/poker_hands/new').to route_to('poker_hands#new')
    end

    it 'routes to #show' do
      expect(get: '/poker_hands/1').to route_to('poker_hands#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/poker_hands/1/edit').to route_to('poker_hands#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/poker_hands').to route_to('poker_hands#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/poker_hands/1').to route_to('poker_hands#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/poker_hands/1').to route_to('poker_hands#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/poker_hands/1').to route_to('poker_hands#destroy', id: '1')
    end
  end
end

require 'spec_helper'
require 'ostruct'

describe GiantBombAdapter do

	GAME_TITLE = 'Banjo-Kazooie'
	INVALID_GAME_TITLE = ''

	context "when searching for a game when valid title" do
    let(:game) { GiantBombAdapter.new(GAME_TITLE).search }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:search).and_return(OpenStruct.new title: GAME_TITLE )
    end

    it 'should return the correct game title' do
      expect(game.title).to eq GAME_TITLE
    end

  end

  context "when searching for a game when invalid title" do
    let(:game) { GiantBombAdapter.new(INVALID_GAME_TITLE).search }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:search).and_return(OpenStruct.new title: GiantBombAdapter::INVALID_TITLE )
    end

    it 'should return the null object pattern user' do
      expect(game.title).to eq GiantBombAdapter::INVALID_TITLE
    end

  end
end
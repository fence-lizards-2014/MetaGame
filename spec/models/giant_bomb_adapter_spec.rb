require 'spec_helper'
require 'ostruct'

describe GiantBombAdapter do

	GAME_TITLE = 'Banjo-Kazooie'
	INVALID_GAME_TITLE = ''
  PLATFORM_ID = '43' # Nintendo 64
  INVALID_PLATFORM_ID = ''

	context "when searching for a game when valid title" do
    let(:game) { GiantBombAdapter.new(GAME_TITLE, PLATFORM_ID).search }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:search).and_return(OpenStruct.new title: GAME_TITLE )
    end

    it 'should return the correct game title' do
      expect(game.title).to eq GAME_TITLE
    end

  end

  context "when searching for a game when invalid title" do
    let(:game) { GiantBombAdapter.new(INVALID_GAME_TITLE, INVALID_PLATFORM_ID).search }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:search).and_return(OpenStruct.new title: GiantBombAdapter::INVALID_TITLE )
    end

    it 'should return the null object pattern user' do
      expect(game.title).to eq GiantBombAdapter::INVALID_TITLE
    end

  end

  context "when searching for a console's games when valid console_id" do
    let(:game) { GiantBombAdapter.new(GAME_TITLE, PLATFORM_ID).get_games_by_console }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:get_games_by_console).and_return(OpenStruct.new platform_id: PLATFORM_ID )
    end

    it 'should return the correct game title' do
      expect(game.platform_id).to eq PLATFORM_ID
    end

  end

  context "when searching for a console's games when invalid platform id" do
    let(:game) { GiantBombAdapter.new(INVALID_GAME_TITLE, INVALID_PLATFORM_ID).get_games_by_console }

    before(:each) do
      allow_any_instance_of(GiantBombAdapter).to receive(:get_games_by_console).and_return(OpenStruct.new platform_id: GiantBombAdapter::INVALID_ID )
    end

    it 'should return the null object pattern user' do
      expect(game.platform_id).to eq GiantBombAdapter::INVALID_ID
    end

  end
end
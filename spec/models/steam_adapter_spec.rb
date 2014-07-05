require 'spec_helper'
require 'ostruct'

describe SteamAdapter do

  USER_NAME = "misterdamon"
  STEAM_ID = '76561198076227521'

  context "when asking for a player summary with valid key and steam id" do

    let(:player) { SteamAdapter.new('76561198076227521').get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: 'misterdamon', steam_id: "76561198076227521") )
    end

    it 'should return the correct user name from results' do
      expect(player.user_name).to eq USER_NAME
    end

    it 'should return the correct steamid from results' do
      expect(player.steam_id).to eq STEAM_ID
    end

  end

  context "when asking for a player summary with invalid steam id" do

    let(:player) { SteamAdapter.new('XXXXXXXXXXXXXXXXX').get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: SteamAdapter::NOT_VALID_USER, steam_id: SteamAdapter::NOT_VALID_STEAM_ID) )
    end

    it 'should return the correct user name from results' do
      expect(player.user_name).to eq SteamAdapter::NOT_VALID_USER
    end

    it 'should return the correct steamid from results' do
      expect(player.steam_id).to eq SteamAdapter::NOT_VALID_STEAM_ID
    end

  end

  # context "when asking for a player's friend list" do

  #   let(:player) { SteamAdapter.new('76561198076227521').get_friend_list }

  #   before(:each) do
  #     allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: 'misterdamon', steam_id: "76561198076227521") )
  #   end
  # end

end


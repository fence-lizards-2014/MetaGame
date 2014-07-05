require 'spec_helper'
require 'ostruct'

describe SteamAdapter do

  USER_NAME = "misterdamon"
  STEAM_ID = '76561198076227521'
  FRIEND_STEAM_ID = '76561197960265731'
  RELATIONSHIP = 'friend'

  context "when asking for a player summary when valid key and steam id" do
    let(:player) { SteamAdapter.new(STEAM_ID).get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: USER_NAME, steam_id: STEAM_ID) )
    end

    it 'should return the correct user name from results' do
      expect(player.user_name).to eq USER_NAME
    end

    it 'should return the correct steamid from results' do
      expect(player.steam_id).to eq STEAM_ID
    end

  end

  context "when asking for a player summary when invalid steam id" do
    let(:player) { SteamAdapter.new('XXXXXXXXXXXXXXXXX').get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: SteamAdapter::NOT_VALID_USER, steam_id: SteamAdapter::NOT_VALID_STEAM_ID) )
    end

    it 'should return the null object pattern user' do
      expect(player.user_name).to eq SteamAdapter::NOT_VALID_USER
    end

    it 'should return the null object pattern steam id' do
      expect(player.steam_id).to eq SteamAdapter::NOT_VALID_STEAM_ID
    end

  end

  context "when asking for a user's friend list when valid steam id" do
    let(:player) { SteamAdapter.new(STEAM_ID).get_friend_list }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_friend_list).and_return(OpenStruct.new(steam_id: FRIEND_STEAM_ID, relationship: RELATIONSHIP) )
    end

    it "it should return a friend's steam id when valid steam id" do
      expect(player.steam_id).to eq FRIEND_STEAM_ID
    end

    it "it should return a relationship value to the friend when valid steam id" do
      expect(player.relationship).to eq RELATIONSHIP
    end
  end

  context "when asking for a user's friend list when invalid steam id" do
    let(:player) { SteamAdapter.new('XXXXXXXXXXXXXXXXX').get_friend_list }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_friend_list).and_return(OpenStruct.new(user_name: SteamAdapter::NOT_VALID_USER, steam_id: SteamAdapter::NOT_VALID_STEAM_ID) )
    end

    it 'should return the null object pattern user' do
      expect(player.user_name).to eq SteamAdapter::NOT_VALID_USER
    end

    it 'should return the null object pattern steam id' do
      expect(player.steam_id).to eq SteamAdapter::NOT_VALID_STEAM_ID
    end
  end

end


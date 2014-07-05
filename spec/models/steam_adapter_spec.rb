require 'spec_helper'
require 'ostruct'

describe SteamAdapter do

  context "when asking for a player summary" do

    let(:player) { SteamAdapter.new('76561198076227521').get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new(user_name: 'misterdamon', steam_id: "76561198076227521") )
    end

    it 'should return the correct user name from results' do
      expect(player.user_name).to eq "misterdamon"
    end

    it 'should return the correct steamid from results' do
      expect(player.steam_id).to eq '76561198076227521'
    end

  end

  context "when asking for a player's friend list" do


  end

end

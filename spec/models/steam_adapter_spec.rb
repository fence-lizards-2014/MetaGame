require 'spec_helper'
require 'ostruct'

describe SteamAdapter do
  let(:player) { SteamAdapter.get_player_summaries }

  before(:each) do
    allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new( user_name: 'misterdamon', user_steam_id: '76561198076227521') )
  end


  context "when asking for a player summary" do
    it 'should return the correct user_name from results' do
      expect(player.user_name).to eq 'misterdamon'
    end
  end
end

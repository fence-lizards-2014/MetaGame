require 'spec_helper'
require 'ostruct'

describe SteamAdapter do

  context "when asking for a player summary" do

    let(:player) { SteamAdapter.get_player_summaries }

    before(:each) do
      allow_any_instance_of(SteamAdapter).to receive(:get_player_summaries).and_return(OpenStruct.new( personaname: 'misterdamon', steamid: "76561198076227521") )
    end

    it 'should return the correct user information from results' do
      expect(player.personaname).to eq "misterdamon"
      expect(player.steamid).to eq '76561198076227521'
    end

    # it 'should return the correct steamid from results' do
    #   expect(player.steamid).to eq '76561198076227521'
    # end

  end

end

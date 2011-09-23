#game_spec.rb
require 'rspec'
require 'gametdd'
require 'stringio'

describe Gametdd do
    before(:each) do
        @g = Gametdd.new
    end

    it "should return true if input is y" do
        check = "y"
        @g.input(check).should == true
    end

    it "should switch players" do
        @g.turn = @g.ai

        @g.switchPlayers       

        @g.turn.should == @g.player
        
        @g.turn = @g.player
        
        @g.switchPlayers
            
        @g.turn.should == @g.ai
    end
end

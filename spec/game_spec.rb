#game_spec.rb
require 'rspec'
require 'gametdd'
require 'stringio'

describe Gametdd do
    before(:each) do
        @g = Gametdd.new
    end

    it "should return true if input is y" do
        @i_in = StringIO.new "y\n"
        $stdin = @i_in
    
        begin
        @g.inputY.should == "y"
    
        ensure
        $stdin.close
        $stdin = STDIN
        end

    end

    it "should switch players" do
        @g.turn = @g.player
        
        @g.switchPlayers
            
        @g.turn.should == @g.ai
        
        @g.turn = @g.ai
        
        @g.switchPlayers
            
        @g.turn.should == @g.player
    end
    
end

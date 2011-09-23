#ai_spec.rb
require 'rspec'
require 'playertdd'
require 'boardtdd'
require 'rulestdd'
require 'aitdd'

describe Aitdd do
    
    before(:each) do
        @ai  = Aitdd.new(Rulestdd.new(Boardtdd.new))
    end

    it "should have the marker ':o'" do
        @ai.marker.should == :o
    end
    
    it "should choose a correct move" do
        @ai.rules.board.b[0] = :o
        @ai.rules.board.b[1] = :o
        @ai.rules.board.b[2] = "-"
        @ai.rules.board.b[4] = :x
        @ai.rules.board.b[7] = :x
        
        @ai.getMove.should == 2
                
        @ai.rules.board.b[4] = :o
        @ai.rules.board.b[6] = :o
        @ai.rules.board.b[2] = "-"
        @ai.rules.board.b[5] = :x
        @ai.rules.board.b[8] = :x
        
        @ai.getMove.should == 2
    end
    
    it "should choose winning move over first negamx choice" do
        @ai.rules.board.b[0] = :o
        @ai.rules.board.b[3] = :o
        @ai.rules.board.b[6] = "-"
        @ai.rules.board.b[2] = :x
        @ai.rules.board.b[8] = :x
            
        @ai.getMove.should == 6

        @ai.rules.board.b[0] = "-"
        @ai.rules.board.b[3] = :o
        @ai.rules.board.b[6] = :o
        @ai.rules.board.b[2] = :x
        @ai.rules.board.b[5] = :x
            
        @ai.getMove.should == 0
    end
end

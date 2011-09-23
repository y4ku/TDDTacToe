#rules_spec.rb
require 'rspec'
require 'boardtdd'
require 'rulestdd'

describe Rulestdd do
    before(:each) do
        @r = Rulestdd.new(Boardtdd.new)
    end

    it "should have a board object" do
        @r.board.class.should == Boardtdd
    end
    
    it "should return nil when board is empty" do
        @r.whoWon.should == nil
    end


    it "should return win in horizontal cases for 'X'" do
        for i in 0..2 
            @r.board.b[i] = :x
        end 

        @r.whoWon.should == :x
        
        for i in 3..5 
            @r.board.b[i] = :x
            @r.board.b[i-3] = "-"
        end 
        @r.whoWon.should == :x
  
        for i in 6..8 
            @r.board.b[i] = :x
            @r.board.b[i-3] = "-"
        end 
        @r.whoWon.should == :x
    end
    
    it "should return win in horizontal cases for 'O'" do
        for i in 0..2 
            @r.board.b[i] = :o
            @r.board.b[i+3] = :o
            @r.board.b[i+6] = :o
            @r.whoWon.should == :o
            @r.board.b[i] = "-"
            @r.board.b[i+3] = "-"
            @r.board.b[i+6] = "-"

        end 
    end

    it "should return nil for bad moves" do
        @r.isValidMove?(10).should == false
    end
    
    it "should return nil if space is taken" do
        @r.board.b[4] = :o
        @r.isValidMove?(4).should == false
    end
    
    it "should check if board is full" do
        for i in 0..8 do
            @r.board.b[i] = :x
        end
            @r.isFull?.should == true;
    end

end

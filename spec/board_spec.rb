#board_spec.rb
require 'rspec'
require 'boardtdd'

describe Boardtdd do
    before(:each) do
        @b = Boardtdd.new
    end

    it "should exist" do
        !@b.nil?.should
    end

    it "should contain a size 8 array" do
        @b.b.count.should == 9
    end  
    
    it "should return false when board not full" do
        @b.isFull?.should == false
    end

    it "should return true when board is full" do
        for i in 0..8
            @b.b[i] = :x
        end

        @b.isFull?.should == true

    end
    
    it "should place a move" do
        @b.placeMove(4, :x);
        @b.b[4].should == :x
    end
end

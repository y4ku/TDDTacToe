#game_spec.rb
require 'rspec'
require 'gametdd'
require 'rubygems'
require 'constants'
require 'stringio'

describe Gametdd do
    before(:each) do
        @original_stdin = $stdin
        @myio_in = StringIO.new
        @g = Gametdd.new
    end

    it "should ask simple yes or no questions" do
        
        @myio_in.string = "y\n"
        
        $stdin = @myio_in
    
        @g.askyesno("to go first").should == "y"
    
        @myio_in.string = "n\n"
        
        $stdin = @myio_in

        @g.askyesno("to go first").should == "n"

    end

    it "should keep asking until proper input found" do 

        @myio_in.string = "moose\n5\n9\ny\n"

        $stdin = @myio_in

        @g.askyesno("to go first").should == "y"

        @myio_in.string = "moose\n5\n9\nn\n"

        $stdin = @myio_in

        @g.askyesno("to go first").should == "n"

    end

    it "should switch player" do

        @g.turn = @g.player

        @g.switchPlayer

        @g.turn.should == @g.ai
    
        @g.turn = @g.ai
        
        @g.switchPlayer
        
        @g.turn.should == @g.player

    end
    

    it "should congratulate human on win" do
        @myio_out = StringIO.new
        $stdout = @myio_out

        @g.turn = @g.player

        @g.win

        @myio_out.string.should == "Congratulations Human, You Won.\n"

        @myio_in.string = "n\n"

        $stdin = @myio_in
  
      
    end

    it "should congratulate CPU on win" do
        @myio_out = StringIO.new
        $stdout = @myio_out

        @g.turn = @g.ai

        @g.win

        @myio_out.string.should == "CPU Won, You Lose.\n"  
        
        @myio_in.string = "n\n"

        $stdin = @myio_in
  
        
    end

end

#player_spec.rb
require 'rspec'
require 'playertdd'
require 'stringio'

describe Playertdd do
    before(:each) do
        @p = Playertdd.new
    end

    it "should have the marker ':x'" do
        @p.marker.should == :x
    end

    it "should get input from stdin" do
        @original_stdin = $stdin
        @myio_in = StringIO.new

        @myio_in.string = "4\n"
        $stdin = @myio_in

        @p.getMove.should == 4
    
        $stdin.close
        $stdin = @original_stdin

    end

end

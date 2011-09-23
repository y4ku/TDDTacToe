load 'boardtdd.rb'
load 'rulestdd.rb'
load 'playertdd.rb'
load 'aitdd.rb'

class Gametdd

    attr_reader :player, :ai
    attr_accessor :turn

    def initialize
        @rules = Rulestdd.new(Boardtdd.new)
        @player = Playertdd.new
        @ai = Aitdd.new(@rules)
        @turn = @player
    end

    def begin
        
        puts "Welcome to Tic Tac Toe"

        puts "Would you like to go first?"  

        print "(y/n): "        

        check = gets.chomp
        while !input(check)
            check = gets.chomp
        end

        if check == "y" then @turn = @player
        else @turn = @ai end    

        @rules.board.boardPrint

        while !@rules.isFull?
        
            @turn.announce        

            while !@rules.isValidMove?(move = @turn.getMove)
            end
        
            @rules.board.placeMove(move, @turn.marker)

            @rules.board.boardPrint
            
            if(@turn.marker == @rules.whoWon)
                win
            end

            switchPlayers

        end
        
    end 

    def input(check)
        
        if(check == "y" || check == "n")
            return true
        else
            print "Invalid move, Try Again: "
            return false
        end      
    end

    def switchPlayers
        @turn = @turn == @player ? @ai : @player
    end

    def win
        if(@turn == @player)
            puts "Contratulations Human, You Won."
        else
            puts "CPU Won."
        end
        
        exit
    end
        
end

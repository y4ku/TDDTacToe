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

    def start
        
        puts "Welcome to Tic Tac Toe"

        puts "Would you like to go first?"  

        print "(y/n): "        

        if getInput then @turn = @player
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

        draw
    end

    def draw
        puts "Game is a Draw!"
        @rules.board.boardPrint
        reset
    end
        
    def getInput
        check = gets.chomp
        while !input(check)
            check = gets.chomp
        end

        return check
    end

    def input(check)
        
        if(check == "y" || check == "n")
            return true
        else
            print "Invalid input, Try Again: "
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
        
        reset        

        exit
    end
    
    def reset
        print "Would you like to play again? (y/n): "
        if getInput then 
            @rules = Rulestdd.new(Boardtdd.new)
            @ai = Aitdd.new(@rules)
            start
        else 
            puts "GoodBye!"
            exit 
        end

    end
end

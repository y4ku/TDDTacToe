#aitdd.rb
class Aitdd < Playertdd

    attr_accessor :rules
    
def initialize(rules, p = :o)
    @marker = p
    @rules = rules
end

def nextMoveWin(player = @marker)
    for i in 0..2
        check = i*3
        if(player == @rules.board.b[check+1] && player == @rules.board.b[check+2]) then               
            if @rules.isValidMove?(check) then return @bmove = check end
        end
        if(player == @rules.board.b[check] && player == @rules.board.b[check+2]) then
            if @rules.isValidMove?(check+1) then return @bmove = check+1 end
        end
        if(player == @rules.board.b[check] && player == @rules.board.b[check+1]) then
            if @rules.isValidMove?(check+2) then return @bmove = check+2 end
        end
        if(player == @rules.board.b[i+3] && player == @rules.board.b[i+6]) then
            if @rules.isValidMove?(i) then return @bmove = i end
        end
        if(player == @rules.board.b[i] && player == @rules.board.b[i+6]) then
            if @rules.isValidMove?(i+3) then return @bmove = i+3 end
        end
        if(player == @rules.board.b[i] && player == @rules.board.b[i+3]) then
            if @rules.isValidMove?(i+6) then return @bmove = i+6 end
        end
    end
    
    if(player == @rules.board.b[4] &&  player == @rules.board.b[8]) then
        if @rules.isValidMove?(0) then return @bmove = 0 end
    end
    if(player == @rules.board.b[0] &&  player == @rules.board.b[8]) then
        if @rules.isValidMove?(4) then return @bmove = 4 end
    end
    if(player == @rules.board.b[0] &&  player == @rules.board.b[4]) then
        if @rules.isValidMove?(8) then return @bmove = 8 end
    end
    if(player == @rules.board.b[4] && player == @rules.board.b[6]) then
        if @rules.isValidMove?(2) then return @bmove = 2 end
    end
    if(player == @rules.board.b[2] && player == @rules.board.b[6]) then
        if @rules.isValidMove?(4) then return @bmove = 4 end
    end
    if(player == @rules.board.b[2] && player == @rules.board.b[4]) then
       if @rules.isValidMove?(6) then return @bmove = 6 end
    end
    return nil
end
    
    def negamax(p = @marker, depth = 0)
		
			if @rules.whoWon == p then 
				return 1
			elsif @rules.whoWon == (p == :o ? :x : :o) 
				return -1
			elsif @rules.isFull?
				return 0
			end
			
		best = -10000
		bestmove = -10000
		
		for i in 0..8
			if @rules.isValidMove?(i) then
				@rules.board.placeMove(i, p)
				value = -negamax(p == :o ? :x : :o , depth + 1)
				@rules.board.placeMove(i, '-')
				if value > best then
					best = value
					@bmove = i if depth == 0
				end
			end
		end		
		return best	
	end

	def getMove
        if nextMoveWin != nil
            return @bmove
        end
		negamax
		return @bmove
	end
    
    def announce
        puts "CPU Turn!\n"
    end

end

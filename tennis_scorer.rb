class TennisScorer
    #attr_reader :@score
    
    PLAYERS = %i[server receiver]

    def initialize
        @score = {server: 0, receiver: 0}
    end

    #p @score
    # on 4-3-2024 add to this method to make score 40 instead of 45 if the player scores 3 times
    def score
        #if @score[:server] == 3 && @score[:receiver] == 3 
        #    "#{@score[:server] * 15 - 5}-#{@score[:receiver] * 15 - 5}"
        if @score[:server] == 3 && @score[:receiver] < 3
            "#{@score[:server] * 15 - 5}-#{@score[:receiver] * 15}"
        elsif @score[:server] == 4 && @score[:receiver] ==  3
            "Advantage-server"
        elsif @score[:server] == 3 && @score[:receiver] ==  4
            "Advantage-receiver"
        elsif @score[:receiver] == 3 && @score[:server] < 3
            "#{@score[:server] * 15 }-#{@score[:receiver] * 15 - 5}"
        elsif @score[:server] == 4 && @score[:receiver] == 4
            "Deuce"
        elsif @score[:server] == 4 && @score[:receiver] < 3
            "W-L"   
        elsif @score[:receiver] == 4 && @score[:server] < 3
            "L-W"   
        else
        #unless @score == 3
            "#{@score[:server] * 15}-#{@score[:receiver] * 15}"
        end
    end

    def give_point_to(player)
        raise "Unknown player #{player}" unless PLAYERS.include?(player)
        @score[player] += 1
    end
end

ts = TennisScorer.new
p ts
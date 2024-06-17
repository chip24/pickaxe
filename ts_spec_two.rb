require_relative "tennis_scorer"

RSpec.describe TennisScorer do
    describe "basic scoring" do
        let(:ts) { TennisScorer.new }
        
        it "starts with a score of 0-0" do
            expect(ts.score).to eq("0-0")
        end
        
        it "make the score 15-0 if the server wins a point" do
            ts.give_point_to(:server)
            expect(ts.score).to eq("15-0")
        end

        it "raises an error if it doesn't know the player" do
            expect { ts.give_point_to(:referee)}.to raise_error(RuntimeError)
        end

        it "makes the score 0-15 if the receiver wins a point" do
            ts.give_point_to(:receiver)
            expect(ts.score).to eq("0-15")
        end
        
        it "makes the score 15-15 after they both win a point" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:server)
            expect(ts.score).to eq("15-15")
        end

        it "makes the score 40-0 after the server wins three points" do
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            expect(ts.score).to eq("40-0")
        end

        it "makes the score 0-40 after the receiver wins three points" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            expect(ts.score).to eq("0-40")
        end
        
        it "makes the score 40-40 after both the server and receiver win three points" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            expect(ts.score).to eq("40-40")
        end
        it "makes the score Deuce after both the server and receiver win four points" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            expect(ts.score).to eq("Deuce")
        end
        it "makes the score W-L after the server wins 4 points and receiver has fewer that 4 points" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            expect(ts.score).to eq("W-L")
        end
        it "makes the score L-W after the receiver wins 4 points and server has fewer that 4 points" do
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:receiver)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            ts.give_point_to(:server)
            expect(ts.score).to eq("L-W")
        end
    end
    
end

require_relative 'board'
require_relative 'computer_player'

class TicTacToe

	def initialize(player1, player2)
		@board = Board.new
		@players = [player1, player2]
		@curr_i = 0
		@over = false	
	end

	def run
		while ! @over
			@board.draw_grid
			puts "Enter the number that corresponds "\
			"to the move you'd like to make."
			try_move
		end
	end

	def try_move
		attempt = gets.chomp
		attempt = attempt.to_i

		if not attempt.between?(1,9)
			puts "You did not enter a valid option. Please try again."
		elsif @board.cels_used.include?(attempt)
			puts "Sorry, that move has already been played."
		else
			num_moves = @board.make_move(@players[@curr_i].id, attempt)
			@players[@curr_i].add_move(attempt)
			check_winner(num_moves) if num_moves > 4
			@curr_i = (@curr_i+1) % 2
		end
	end

	def check_winner(num_moves)
		if winner?
			@over = true
			display_winner
		elsif num_moves == 9
			@over = true
			display_winner(-1)
		end
	end

	def winner?
		moves = @players[@curr_i].my_moves
		win = true
		Board.winners.each do |combo|
			win = true
			combo.each do |cel|
				if ! moves.include?(cel)
					win = false
					break
				end
			end
			break if win
		end
		win
	end

	def display_winner(winner=@curr_i)
		@board.draw_grid
		puts winner == @curr_i ? "PLAYER #{@players[@curr_i].id} WINS!" : "DRAW!"
	end
end

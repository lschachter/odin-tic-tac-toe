require_relative 'tictactoe'

class Menu

	def initialize
		@choice = 0
	end

	def run_menu
		puts "Welcome to Tic Tac Toe!"
		
		while ! @choice.between?(1,3)
			menu_options
			try_choice
		end
	end

	def menu_options
		puts "You have three options:"
		puts
		puts "1) 2 Player"
		puts "2) Play as X vs the computer"
		puts "3) Play as O vs the computer"
		puts
		puts "Enter the number that corresponds to your choice."
	end

	def try_choice
		@choice = gets.chomp
		@choice = @choice.to_i

		if not @choice.between?(1,3)
			puts "You did not enter a valid option. Please try again."
		end
	end

	def run_game
		case @choice
		when 1
			TicTacToe.new(Player.new("X"),Player.new("O"))
		when 2 
			TicTacToe.new(Player.new("X"),Computer_Player.new("O"))
		when 3
			TicTacToe.new(Computer_Player.new("X"),Player.new("O"))
		end
	end
end

def main
	menu = Menu.new
	menu.run_menu
	game = menu.run_game
	game.run
end

main

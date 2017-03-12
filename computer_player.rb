require_relative 'player'
require_relative 'find_winner'

class Computer_Player < Player
	include Find_Winner

	def initialize(id, winners)
		super
		@winners = winners
	end

	def build_tree(starting_move = nil)
		@possible_moves = Hash.new
		(1..9).each do |cel|
			@possible_moves[cel] = false
		end
	end

	def move
		



	end

end









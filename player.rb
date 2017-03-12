class Player
	attr_reader :id, :my_moves

	def initialize(id)
		@id = id
		@my_moves = []
	end

	def add_move(cel)
		@my_moves << cel
	end

end

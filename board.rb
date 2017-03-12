class Board
	@@vert_line = "|"
	@@hor_line =["-----------"]
	@@winners = [
   [1,2,3],[4,5,6],[7,8,9],[1,5,9],
   [7,5,3],[1,4,7],[2,5,8],[3,6,9]
   ]
  attr_reader :moves, :cels_used

	def initialize
		@moves = [[" 1 "," 2 "," 3 "],\
		[' 4 ',' 5 ',' 6 ',],\
		[' 7 ',' 8 ',' 9 ']]
		@moves_made = 0
		@cels_used = []
	end

	def draw_grid
		@moves.each_with_index do |row, i|
			row.each_with_index do |cel, j|
				print cel
				print @@vert_line if j < 2
			end
			puts
			puts @@hor_line if i < 2
		end
	end

	def make_move(player_id, cel)
		row = (cel-1)/3
		col = (cel-1)%3
		@moves[row][col][1] = player_id
		@moves_made += 1
		@cels_used << cel
		@cels_used.length
	end

	def self.winners
		@@winners
	end

end
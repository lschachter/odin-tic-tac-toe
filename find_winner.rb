module Find_Winner

	def winner?(to_check, winners)
		win = false
		winners.each do |combo|
			win = true
			combo.each do |cel|
				if ! to_check.include?(cel)
					win = false
					break
				end
			end
			break if win
		end
		win
	end

end
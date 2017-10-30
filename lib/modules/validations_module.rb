module Valids

	def city_valid?
		@city_input.downcase == @city_name.downcase
	end

	def ex_yes_no_valid?
		@ex_yes_no_input == @ex_yes || @ex_yes_no_input == @ex_no
	end

end
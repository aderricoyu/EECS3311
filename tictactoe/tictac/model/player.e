note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER
	inherit ANY
		redefine out
	end

create
	make_player

feature {NONE} -- Implementation
	make_player(name, letter: STRING; score: INTEGER)

	require
		letter ~ "X" or letter ~ "O"
		valid_name: not name.is_empty and then name.at (name.lower).is_alpha
	do
		set_pname(name)
		set_pletter(letter)
		set_pscore(score)
	end



feature -- constants
	player_name, player_letter: STRING
	player_score: INTEGER

feature -- setters
	set_pname(name: STRING)
	do
		player_name := name
	end


	set_pletter(letter: STRING)
	do
		player_letter := letter
	end

	set_pscore(score: INTEGER)
	do
		player_score := score
	end


feature -- getters
	get_pname: STRING
	do
		Result := player_name
	end


	get_pletter: STRING
	do
		Result := player_letter
	end

	get_pscore: INTEGER 
	do
		Result := player_score
	end


feature -- String representation
	out: STRING
		-- New string representation of player
		do
			create Result.make_empty
			Result := player_score.out + ": score for " + "%"" + player_name + "%" " + "(as " + player_letter + ")%N"
		end
end

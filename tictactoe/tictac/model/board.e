note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD
	inherit ANY
		redefine out
	end

create
	make_board

feature {NONE}
	make_board
	do
		bsize := 3
		create board.make_filled("_", bsize, bsize)
	end


feature
	board: ARRAY2[STRING]
	bsize: INTEGER

feature -- String representation
	out: STRING
			-- New string representing 3x3 board with "_" or "X" or "O" in its place
		local
			i: INTEGER
		do
			create Result.make_empty
			from
				i := board.lower
			until
				i > board.upper
			loop
				if (i\\3 = 0) then
					Result.append(board.at (i) + "%N")
				else
					Result.append(board.at (i))
				end
				i := i + 1
			end
		end
end

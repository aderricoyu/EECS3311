note
	description: "Summary description for {STUDENT_TESTS}. Amanda D'Errico's unittests"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_TESTS
inherit
	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do

			add_boolean_case (agent t1)
		--	add_boolean_case (agent t2)
			--add_boolean_case (agent t3)
		--	add_boolean_case (agent t4)
		--	add_boolean_case (agent t5)
		--	add_boolean_case (agent t6)
		--	add_boolean_case (agent t7)

			--violation cases
			add_violation_case (agent t8)
			add_violation_case (agent t9)
		--	add_violation_case_with_tag ("valid_expression", agent t10)
		--	add_violation_case_with_tag ("valid_expression", agent t11)
		end

feature -- tests
	t1: BOOLEAN
	-- Checks if a Player is created appropriately
		local
			p1, p2: PLAYER
		do
			comment("t1: Create Player with name and letter")
			create p1.make_player("Amanda", "X", 0)
			create p2.make_player("Mike", "O", 0)
			Result := p1.get_pname = "Amanda" and p2.get_pname = "Mike"
			Result := p1.get_pletter = "X" and p2.get_pletter = "O"
			Result := p1.get_pscore = 0 and p2.get_pscore = 0
			check Result end
		end


feature -- violations
	t8
		local
			p1: PLAYER
		do
			comment("t8: Create player with name and letter %"Y%". Bad syntax: letter must be %"X%" or %"O%"")
			create p1.make_player("Amanda", "Y", 0)
		end


	t9
		local
			p1: PLAYER
		do
			comment("t9: Create player with invalid name: Invalid name, must not start with non alpha character")
			create p1.make_player(";Amanda", "X", 0)
		end

end

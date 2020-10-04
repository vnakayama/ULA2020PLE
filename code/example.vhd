LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ula IS
	PORT ( 
		op: IN std_logic_vector (2 downto 0); 
		a, b: IN std_logic_vector (3 downto 0);
		res: OUT std_logic_vector (3 downto 0);
		carry_out: OUT std_logic;
		overflow: OUT std_logic
	);
END ula;

ARCHITECTURE dataflow of ula IS
	SIGNAL c_out, b_out, o_0, o_1: std_logic;
	SIGNAL a_0, b_0, r_0: std_logic_vector (3 downto 0);
	SIGNAL a_1, b_1, r_1: std_logic_vector (3 downto 0);
	SIGNAL a_2, b_2, r_2: std_logic_vector (3 downto 0);
	SIGNAL a_3, r_3: std_logic_vector (3 downto 0);
	SIGNAL a_4, b_4, r_4: std_logic_vector (3 downto 0);
	SIGNAL a_5, b_5, r_5: std_logic_vector (3 downto 0);
	SIGNAL a_6, b_6, r_6: std_logic_vector (3 downto 0);
	SIGNAL a_7, b_7, r_7: std_logic_vector (3 downto 0);
	SIGNAL zero, one: std_logic;

	BEGIN
	-- component instantiation
		one <= '1';
		zero <= '0';
--		G1: IF (op = "000") GENERATE
		add: work.somador4 PORT MAP (a_0, b_0, zero, r_0, c_out, o_0);
--		END GENERATE G1;
--		G2: IF (op = "001") GENERATE
		sub: work.subtrator4 PORT MAP (a_1, b_1, r_1, b_out, o_1);
--		END GENERATE G2;
--		G3: IF (op = "010") GENERATE
		and4: work.and4bits PORT MAP (a_2, b_2, r_2);
--		END GENERATE G3;
		
		PROCESS( a_0 ) BEGIN
			IF (op = "000") THEN -- somador
				a_0 <= a;
				b_0 <= b;
				res <= r_0;
				carry_out <= c_out;
				overflow <= o_0;
			ELSIF (op = "001") THEN -- subtrator
				a_1 <= a;
				b_1 <= b;
				res <= r_1;
				carry_out <= b_out;
				overflow <= o_1;
			ELSIF (op = "010") THEN -- and
				a_2 <= a;
				b_2 <= b;
				res <= r_2;
				carry_out <= zero;
				overflow <= zero;
			END IF;
			
		END PROCESS;
		
		
--		add0: somador1 PORT MAP (a(0), b(0), carry_in, sum(0), co(0));
--		ci(1) <= co(0);
--		add1: somador1 PORT MAP (a(1), b(1), ci(1), sum(1), co(1));
--		ci(2) <= co(1);
--		add2: somador1 PORT MAP (a(2), b(2), ci(2), sum(2), co(2));
--		ci(3) <= co(2);
--		add3: somador1 PORT MAP (a(3), b(3), ci(3), sum(3), carry_out);
--			

END ARCHITECTURE;
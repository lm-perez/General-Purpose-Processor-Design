LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Negsseg IS
	PORT (neg		:IN STD_LOGIC;
			negleds	:OUT STD_LOGIC_VECTOR(0 TO 6));
	END Negsseg;
	
ARCHITECTURE BEHAVIOUR OF Negsseg IS
BEGIN
			PROCESS (neg)
				BEGIN
				Case(neg) IS
				WHEN '0'=> negleds <="1111111";
				WHEN '1'=> negleds <="1111110";
				WHEN OTHERS => negleds<="-------";
				END CASE;
			END PROCESS;
End BEHAVIOUR;
		
		
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY sseg3h IS
	PORT (sid		:IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			leds	:OUT STD_LOGIC_VECTOR(0 TO 6));
	END sseg3h;
	
	
ARCHITECTURE BEHAVIOUR OF sseg3h IS
BEGIN
PROCESS (sid)
BEGIN
if (sid>"0101") THEN
leds<="1000100";
	ELSE 
	leds<="1101010";
	END IF;
	END PROCESS;
END BEHAVIOUR;
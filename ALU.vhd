LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY ALU IS
	PORT( 		A,B		:IN	 unsigned(7 DOWNTO 0);		
		operator	:IN unsigned (15 DOWNTO 0);
			neg: OUT STD_LOGIC;
			mag1: OUT unsigned (3 DOWNTO 0);
			mag2: OUT unsigned (3 DOWNTO 0));	--magnitude (could be two numbers)
			
END ALU;

ARCHITECTURE Calculation OF ALU IS

SIGNAL m1, m2, result: unsigned (7 DOWNTO 0):=(others=>'0');
SIGNAL m4: unsigned (0 TO 7);

BEGIN

m1 <= A; --temporarily store A in m1 local variable
m2 <= B; --temporarily store B in m2 local variable
--m4 <= neg;
PROCESS (operator)
BEGIN
		CASE operator IS
			WHEN "0000000000000001" =>
				result <= (A+B);
				neg <= '0';
			WHEN "0000000000000010" => --neg lol how?
				IF (A<B) THEN
				neg <= '1';
				result <= (not (A + (not(B) + "00000001")) + "00000001");
					ELSE
					neg <= '0';
					result <= (not (A + (not(B) + "00000001")) + "00000001");
					END IF;
			WHEN "0000000000000100" =>
				result <= (not A);
				neg <= '0';
			WHEN "0000000000001000" =>
				result <= (A nand B);
				neg <= '0';
			WHEN "0000000000010000" =>
				result <= (A nor B);
				neg <= '0';
			WHEN "0000000000100000" =>
				result <= (A and B);
				neg <= '0';
			WHEN "0000000001000000" =>
				result <= (A xor B);
				neg <= '0';
			WHEN "0000000010000000" =>
				result <= (A or B);
				neg <= '0';
			WHEN "0000000100000000" =>
				result <= (A xnor B);
				neg <= '0';
			WHEN OTHERS => 
				result <= "00000000";
				neg <= '0';
		END CASE;
END PROCESS;
mag1 <=result(3 downto 0);
mag2 <= result(7 downto 4);

END Calculation;
                                      
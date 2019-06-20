library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity score_1 is
	port(
		score1 : in std_logic;
		output_score1 : out std_logic
	
	);
end entity score_1;

architecture behaviour of score_1 is
begin
process(score1)
begin
	if (score1'event and score1 = '1') then
		output_score1 <= '1';
	end if;
end process;
end architecture;
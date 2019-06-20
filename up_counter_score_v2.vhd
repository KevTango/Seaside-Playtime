library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTIty up_counter_score_v2 IS
	PORT(
		Input :IN STD_LOGIC;
		Reset : IN STD_LOGIC;
		output : out std_logic
	);
END ENTITY;

ARCHITECTURE behaviour OF up_counter_score_v2 IS
signal temp_output : std_logic;
BEGIN
	PROCESS(Reset, Input)
	BEGIN
		if (input = '1') then
			output <= '1';
		else
			output <= '0';
		end if;
	END PROCESS;
END ARCHITECTURE;
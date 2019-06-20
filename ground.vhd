-- This file sets the ground in the game
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity ground is 
	port(
		pixel_row, pixel_column 	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		Ground_on						: OUT STD_LOGIC;
		Ground_Output					: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
end entity ground;

ARCHITECTURE BEHAVIOUR OF ground IS
	SIGNAL Colour_On			: STD_LOGIC;
BEGIN
	-- Output Colour
	Ground_Output(2) <= '0';
	Ground_Output(1) <= Colour_on;
	Ground_Output(0) <= Colour_on;
	
	PROCESS(pixel_row, pixel_column)
	BEGIN
		IF((pixel_column >= 0) and (pixel_column <= 640) and (pixel_row > 400) and (pixel_row < 480)) THEN
			Ground_on <= '1';
			Colour_On <= '1';
		ELSE
			Ground_on <= '0';
			Colour_On <= '0';
		END IF;
	END PROCESS;
END ARCHITECTURE;
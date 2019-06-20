-- A 16 bit up counter used to output to the 7 segment display
-- Author: Kevin Tang
-- Date Created: 01/05/2019

library IEEE;
USE IEEE.STD_LOGIC_1164.all;
--USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTIty up_counter IS
	PORT(
		Input :IN STD_LOGIC;
		Reset : IN STD_LOGIC;
		Output : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END ENTITY;

ARCHITECTURE behaviour OF up_counter IS
BEGIN
	PROCESS(Reset, Input)
		VARIABLE thousands : std_logic_vector(3 downto 0);
		VARIABLE hundreds	: std_logic_vector(3 downto 0);
		VARIABLE tens : std_logic_vector(3 downto 0);
		VARIABLE ones : std_logic_vector(3 downto 0) := "0001";
	BEGIN
		IF(Reset = '1') THEN
			thousands := "0000";
			hundreds := "0000";
			tens := "0000";
			ones := "0001";
		ELSIF(Input'event AND Input = '1') THEN
			ones := ones + 1;
			IF(ones = "1010") THEN
				ones := "0000";
				tens := tens + 1;
			END IF;
			IF(tens = "1010") THEN
				tens := "0000";
				hundreds := hundreds + 1;
			END IF;
			IF(hundreds = "1010") THEN
				hundreds := "0000";
				thousands := thousands + 1;
			END IF;
			IF(thousands = "1010") THEN
				thousands := "0000";
			END IF;
		END IF;
		Output <= thousands & hundreds & tens & ones;
	END PROCESS;
END ARCHITECTURE;
library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY up_counter_score IS
	PORT(
		vert_sync :IN STD_LOGIC;
		Input, Input_2 : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		Reset : IN STD_LOGIC;
		Ones : OUT STD_LOGIC_VECTOR(5 downto 0);
		Tens : out std_logic_vector(5 downto 0);
		Hundreds : out std_logic_vector(5 downto 0);
		Thousands : out std_logic_vector(5 downto 0)
	);
END ENTITY;

ARCHITECTURE behaviour OF up_counter_score IS
	SIGNAL temp_ones : std_logic_vector(5 downto 0) := "110000";
	SIGNAL temp_tens : std_logic_vector(5 downto 0) := "110000";
	SIGNAL temp_hundreds : std_logic_vector(5 downto 0) := "110000";
	signal temp_thousands : std_logic_vector(5 downto 0) := "110000";
	signal input_flag, input2_flag : std_logic;
	signal temp_input, temp_input2 : std_logic;
BEGIN
	PROCESS(Reset, Input, temp_ones, temp_tens, temp_hundreds, temp_thousands, Input_2, vert_sync)
	BEGIN
		IF(Reset = '1') THEN
			temp_ones <= "110000";
			temp_tens <= "110000";
			temp_hundreds <= "110000";
			temp_thousands <= "110000";
		ELSIF(vert_sync'event AND vert_sync = '1') THEN
			IF((Input >= CONV_STD_LOGIC_VECTOR(317,11) AND (Input <= CONV_STD_LOGIC_VECTOR(320,11))) OR ((Input_2 >= CONV_STD_LOGIC_VECTOR(317,11)) AND (Input_2 <= CONV_STD_LOGIC_VECTOR(320,11)))) THEN
				temp_ones <= temp_ones + 1;
				-- Ones
				IF(temp_ones = "111001") THEN
					temp_ones <= "110000";
					temp_tens <= temp_tens + 1;
				END IF;
				
				-- Tens
				IF(temp_tens = "111001") THEN
					temp_tens <= "110000";
					temp_hundreds <= temp_hundreds + 1;
				END IF;
				
				-- Hundreds
				IF(temp_hundreds = "111001") THEN
					temp_hundreds <= "110000";
					temp_thousands <= temp_thousands + 1;
				END IF;
				
				-- Thousands
				IF(temp_thousands = "111001") THEN
					temp_thousands <= "110000";
				END IF;
			END IF;
		END IF;
		Ones <= std_logic_vector(temp_ones);
		Tens <= std_logic_vector(temp_tens);
		Hundreds <= std_logic_vector(temp_hundreds);
		Thousands <= std_logic_vector(temp_thousands);
	END PROCESS;
END ARCHITECTURE;
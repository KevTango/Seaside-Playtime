-- This file generates gifts
-- 1 type of gift that fully restores health
-- 1 type of gift that fully restores energy
-- 1 type of gift that gives invulnerability
-- Increases score by 5
-- Gift positioned after every 5th gift
-- Type of gift will be determined by a 2 bit LFSR // Should rotate

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;
use ieee.numeric_std.all;

ENTITY gifts IS
Generic(ADDR_WIDTH: integer := 12; DATA_WIDTH: integer := 1);

	PORT(
		level_tracker, vert_sync, collision_check : IN std_logic;
		pixel_column, pixel_row, increased_speed 	: IN std_logic_vector(10 DOWNTO 0);
		pause_enable, reset_flag, training_mode	: IN std_logic;
		gift_enable 										: OUT std_logic;
		gift_output 										: OUT std_logic_vector(2 DOWNTO 0);
		gift_x_pos_output 								: OUT std_logic_vector(10 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behaviour OF gifts IS
		SIGNAL gift_size, gift_y_size, gift_y_motion, gift_y_pos 	: std_logic_vector(10 downto 0);
		SIGNAL gift_x_pos 														: std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(640,11);
		SIGNAL gift_x_motion 													: std_logic_vector(10 downto 0) := -CONV_STD_LOGIC_VECTOR(5,11);
		SIGNAL level_register													: std_logic;
		SIGNAL gift_flag															: std_logic;
		SIGNAL gift_colour														: std_logic;
	BEGIN
		-- Gift Block Initialisation
		gift_size <= CONV_STD_LOGIC_VECTOR(5,11);
		gift_y_pos <= CONV_STD_LOGIC_VECTOR(225,11);
		
		-- Output Colours
		gift_output(2) <= gift_colour;
		gift_output(1) <=	gift_colour;
		gift_output(0) <= gift_colour;
		-- Display the gift only if there is no collision 
	Gift_RGB_Display: PROCESS(gift_x_pos, gift_y_pos, gift_size, pixel_row, pixel_column, level_register, training_mode)
	BEGIN
		IF (gift_X_pos <= pixel_column + gift_size) AND
		-- compare positive numbers only
		(gift_X_pos + gift_size >= pixel_column) AND
		(gift_Y_pos <= pixel_row + gift_size) AND
		(gift_Y_pos + gift_size >= pixel_row) THEN
			IF(level_register = '1') THEN
				gift_enable <= '1';
				gift_colour <= '1';
			ELSIF(level_register = '0') THEN
				gift_enable <= '0';
				gift_colour <= '0';
			END IF;
		ELSE
			gift_enable <= '0';
			gift_colour <= '0';
		END IF;
	END PROCESS;
	
	-- Moving the gift
	Move_Gift: PROCESS(vert_sync, level_tracker, collision_check, gift_x_pos, pause_enable)
	BEGIN
		IF(pause_enable = '1') THEN
			gift_X_pos <= gift_X_pos;
		ELSE
			IF(vert_sync'event AND vert_sync = '1') THEN
				IF(reset_flag = '1' or training_mode = '1') THEN
					gift_X_pos <= CONV_STD_LOGIC_VECTOR(640,11);
					level_register <= '0';
				ELSIF(level_tracker = '1') THEN
					level_register <= '1';
				ELSIF((level_register = '1') AND ((gift_X_pos <= CONV_STD_LOGIC_VECTOR(5,11)) OR (collision_check = '1'))) THEN
					level_register <= '0';
				ELSIF(gift_X_pos <= CONV_STD_LOGIC_VECTOR(4,11)) THEN
					gift_X_pos <= CONV_STD_LOGIC_VECTOR(640,11);
				END IF;
				gift_X_pos <= gift_X_pos + gift_X_motion + increased_speed;
			END IF;
		END IF;
		gift_x_pos_output <= gift_x_pos;
	END PROCESS;
	
END ARCHITECTURE;
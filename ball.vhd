-- This code controls the ball's movement
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;
use ieee.numeric_std.all;

ENTITY ball IS
Generic(ADDR_WIDTH: integer := 12; DATA_WIDTH: integer := 1);

   PORT(SIGNAL left_click, Clock 								: IN std_logic;
		  signal pixel_row, pixel_column 						: IN std_logic_vector(10 downto 0);
		  signal state_input											: in std_logic_vector(3 downto 0);
		  signal vert_sync, no_energy_flag, no_health, game_reset, pause_enable		: IN std_logic;
		  signal ball_y_pos_output 								: OUT std_logic_vector(10 downto 0);
        SIGNAL Red,Green,Blue 									: OUT std_logic;
		  SIGNAL bottom_boundary									: OUT std_logic;
		  signal ball_on_output, Game_Over						: OUT std_logic);		
END ball;

architecture behavior of ball is

			-- Video Display Signals   
SIGNAL Red_Data, Green_Data, Blue_Data, vert_sync_int		: std_logic; 
SIGNAL Ball_Y_motion 												: std_logic_vector(10 DOWNTO 0);
SIGNAL Ball_X_pos										: std_logic_vector(10 DOWNTO 0);
signal Ball_Y_pos : std_logic_vector(10 downto 0) := conv_std_logic_vector(50,11);
-- Ball
SIGNAL Ball_on															: std_logic;
SIGNAL Size 															: std_logic_vector(10 DOWNTO 0); 
-- Mouse
SIGNAL mouse_flag 													: std_logic := '0';
SIGNAL hit_ground														: std_logic := '0';
-- Game Over
SIGNAL disable_flag													: std_logic := '0';
signal t_game_over													: std_logic;

BEGIN           

-- Ball 
Size <= CONV_STD_LOGIC_VECTOR(8,11);
Ball_X_pos <= CONV_STD_LOGIC_VECTOR(320,11);



-- Need internal copy of vert_sync to read

-- Output Ball Colours
Red <= Ball_on;
Green <= Ball_on;
Blue <= '0';
ball_on_output <= ball_on;


Ball_RGB_Display: Process (Ball_X_pos, Ball_Y_pos, pixel_column, pixel_row, Size)
BEGIN
	-- Set Ball_on ='1' to display ball
	IF (Ball_X_pos <= pixel_column + Size) AND
 		-- compare positive numbers only
		(Ball_X_pos + Size >= pixel_column) AND
		(Ball_Y_pos <= pixel_row + Size + 2) AND
		(Ball_Y_pos + Size - 2 >= pixel_row) THEN
			Ball_on <= '1';
 	ELSE
 		Ball_on <= '0';
	END IF;
END process Ball_RGB_Display;

Move_Ball: process (vert_sync, left_click, game_reset, pause_enable, Ball_y_pos)
BEGIN
	-- Move ball once every vertical sync
	if (game_reset = '1') then
		ball_y_pos <= conv_std_logic_vector(50,11);
		hit_ground <= '0';
		bottom_boundary <= '0';
		t_game_over <= '0';
	else
		if (pause_enable = '1') then
			ball_y_pos <= ball_y_pos;
		else
			IF(vert_sync'event and vert_sync = '1') THEN
				bottom_boundary <= '0';
				-- If mouse is off
				IF ((no_energy_flag = '1' OR hit_ground = '1' or no_health = '1')) THEN
					Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(5,11);
					t_game_over <= '1';
					-- Lower boundary condition
					IF (Ball_Y_pos) >= CONV_STD_LOGIC_VECTOR(400,11) - Size THEN
						Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(0,11);
						bottom_boundary <= '1';
					END IF;
					
				ELSIF(left_click = '0' AND mouse_flag = '1') THEN
					-- Ball going down
					Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(2,11);
					-- Lower boundary condition
					IF (Ball_Y_pos) >= CONV_STD_LOGIC_VECTOR(400,11) - Size THEN
						Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(0,11);
						hit_ground <= '1';
						bottom_boundary <= '1';
					elsE
						hit_ground <= '0';
					END IF;
					
				-- If mouse is on	
				ELSIF(left_click = '1') THEN
					-- Ball going up
					mouse_flag <= '1';
					Ball_Y_motion <= - CONV_STD_LOGIC_VECTOR(5,11);
					-- Upper boundary condition
					IF Ball_Y_pos <= CONV_STD_LOGIC_VECTOR(50,11) + Size THEN 
						Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(2,11);
					END IF;
				end if;
				--Compute next ball Y position
				Ball_Y_pos <= Ball_Y_pos + Ball_Y_motion;
				ball_y_pos_output <= ball_y_pos;
			END IF;
		end if;
	end if;
END process Move_Ball;
	
game_over <= t_game_over;


END behavior;


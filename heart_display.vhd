library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity heart_display is 
	port(
		pixel_row, pixel_column : in std_logic_vector (10 downto 0);
		Clk, Collision, vert_sync, bottom_boundary, no_energy, game_reset, training_mode, collision_check				: in std_logic;
		gift_input : in std_logic_vector(1 downto 0);
		Output						: out std_logic_vector(5 downto 0);
		heart_enable, no_health_flag				: out std_logic
	);
end entity heart_display;

architecture behaviour of heart_display is 
	signal collide_flag : std_logic := '0';
	signal health_bar_x_size : std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(80,11);
	signal health_bar_x_start : std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(560,11);
	signal health_bar_y_size : std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(15,11);
	signal health_bar_y_start : std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(0,11);
begin
	-- Health Bar
Health_Bar_Display: process (pixel_column, pixel_row, health_bar_x_size, health_bar_x_start, health_bar_y_size, health_bar_y_start)
BEGIN
	-- Set Energy Bar = '1' to display pipe
	IF (health_bar_x_start <= pixel_column) AND
 		-- compare positive numbers only
		(health_bar_x_start + health_bar_x_size >= pixel_column) AND
		(health_bar_y_start <= pixel_row) AND
		(health_bar_y_start + health_bar_y_size >= pixel_row) THEN
			Output <= "000000";
			heart_enable <= '1';
	ELSE
		heart_enable <= '0';
		Output <= "000000";
	END IF;
END process Health_Bar_Display;

-- Decrease the health bar every time the bird hits the pipe (Maximum of 5 hits)
Move_Health_Bar: process (collision, collide_flag, vert_sync, bottom_boundary, no_energy, game_reset, training_mode, health_bar_x_size)
BEGIN
		if (training_mode = '1') then
			health_bar_x_size <= health_bar_x_size;
		elsE
			IF(vert_sync'event AND vert_sync = '1') THEN
				if (game_reset = '1')then
				no_health_flag <= '0';
				health_bar_x_size <= conv_std_logic_vector(80,11);
				else
					no_health_flag <= '0';
					-- If the health bar is fully depleted
					IF(health_bar_x_size <= CONV_STD_LOGIC_VECTOR(15,11)) then
						no_health_flag <= '1';
					ELSIF(collision_check = '1') AND (gift_input = "00") THEN
						health_bar_x_size <= health_bar_x_size + 16;
						IF(health_bar_x_size > 80) THEN
							health_bar_x_size <= CONV_STD_LOGIC_VECTOR(80,11);
						END IF;
					ELSIF(collision_check = '1') AND (gift_input = "10") THEN
						health_bar_x_size <= health_bar_x_size + 16;
						IF(health_bar_x_size > 80) THEN
							health_bar_x_size <= CONV_STD_LOGIC_VECTOR(80,11);
						END IF;
					ELSIF(bottom_boundary = '1' OR no_energy = '1') THEN
						health_bar_x_size <= CONV_STD_LOGIC_VECTOR(0,11);
					-- Resetting the collide flag
					ELSIF(collision = '0') THEN
						collide_flag <= '0';
					-- Move health bar once every vertical sync
					ELSIF(collision = '1' AND collide_flag = '0') THEN
						health_bar_x_size <= health_bar_x_size - 16;
						collide_flag <= '1';	
					END IF;
				end if;
			END IF;
		end if;
END PROCESS;
end architecture behaviour;
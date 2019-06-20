-- Energy Bar
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY energy_bar IS
PORT(
	clock, left_click, vert_sync, game_reset, pause_enable, training_mode : IN STD_LOGIC;
	pixel_row, pixel_column : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	gift_collision : IN STD_LOGIC;
	gift_check : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	no_energy_flag : OUT STD_LOGIC;
	energy_bar_output : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	energy_bar_enable : OUT STD_LOGIC
);
END ENTITY;

ARCHITECTURE BEHAVIOUR OF energy_bar IS
	signal energy_bar_x_start : std_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(500,11);
	signal energy_bar_y_start : std_LOGIC_VECTOR(10 DOWNTO 0):= CONV_STD_LOGIC_VECTOR(20,11);
	signal energy_bar_y_size : std_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(25,11);
	signal energy_bar_x_size : std_logic_vector(10 downto 0) := CONV_STD_LOGIC_VECTOR(99,11);
	signal energy_bar_colour : std_logic;
	signal energy_bar_count : std_logic_vector(4 downto 0);
BEGIN

-- Colour Output
-- Energy Bar
Energy_Bar_Display: process (pixel_column, pixel_row, energy_bar_x_size, energy_bar_x_start, energy_bar_y_size, energy_bar_y_start)
BEGIN
	
	if (pixel_column >= 540 and pixel_column < 540 + energy_bar_x_size and pixel_row >= 20 and pixel_row <= 45) then
		energy_bar_output <= "001";
		energy_bar_enable <= '1';
	else
		energy_bar_output <= "000";
		energy_bar_enable <= '0';
		end if;

END process Energy_Bar_Display;

Move_Energy_Bar: process(left_click, clock, pixel_row, pixel_column, vert_sync, game_reset, training_mode, pause_enable, energy_bar_x_size)
BEGIN
	if (game_reset = '1' or training_mode = '1') then
		energy_bar_x_size <= CONV_STD_LOGIC_VECTOR(99,11);
		no_energy_flag <= '0';
	else
		if (pause_enable = '1') then
			energy_bar_x_size <= energy_bar_x_size;
		else
			-- Move energy bar once every vertical sync
				IF(vert_sync'event and vert_sync = '1') THEN
					no_energy_flag <= '0';
					IF(gift_collision = '1' AND (gift_check = "01" OR gift_check = "11")) THEN
						energy_bar_x_size <= energy_bar_x_size + 20;
						IF(energy_bar_x_size > CONV_STD_LOGIC_VECTOR(99,11)) THEN
							energy_bar_x_size <= CONV_STD_LOGIC_VECTOR(99,11);
						END IF;
					ELSIF(left_click = '1') THEN
						energy_bar_count <= energy_bar_count + 1;
						IF(energy_bar_count = "11111") then
							energy_bar_x_size <= energy_bar_x_size - 1;
							-- If the energy bar is fully depleted
							IF(energy_bar_x_size <= CONV_STD_LOGIC_VECTOR(0,11)) THEN
								no_energy_flag <= '1';
							END IF;
						END IF;
					END IF;
				END IF;
		end if;
	end if;
END process Move_Energy_Bar;
END ARCHITECTURE;
	
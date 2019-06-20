-- Level Tracker (Will increment speed every 5th pipe)

library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Level_Tracker IS
	PORT(
		no_health, game_reset, training_mode, vert_sync	: IN STD_LOGIC;
		pipe1_x_pos, pipe2_x_pos : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		level_increment : OUT STD_LOGIC;
		increased_speed : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE behaviour OF Level_Tracker IS
	SIGNAL level_flag : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL speed_increase : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(0,11);
BEGIN
Process (level_flag, speed_increase, no_health, game_reset, training_mode, vert_sync)
BEGIN
	-- If game is reset then level flag resets
	IF(no_health = '1') THEN
		speed_increase <= CONV_STD_LOGIC_VECTOR(0,11);
	ELSIF(game_reset = '1' or training_mode = '1') THEN
			level_flag <= "000";
	ELSIF(vert_sync'event AND vert_sync = '1') THEN
		-- Level Up counter
		IF((pipe1_x_pos >= CONV_STD_LOGIC_VECTOR(317,11) AND (pipe1_x_pos <= CONV_STD_LOGIC_VECTOR(320,11))) OR ((pipe2_x_pos >= CONV_STD_LOGIC_VECTOR(317,11)) AND (pipe2_x_pos <= CONV_STD_LOGIC_VECTOR(320,11)))) THEN
			level_flag <= level_flag + 1;
			level_increment <= '0';
			IF(level_flag = "100") THEN
				speed_increase <= speed_increase - 1;
				level_flag <= "000";
				level_increment <= '1';
			END IF;
		END IF;
	END IF;
	increased_speed <= speed_increase;
END process Level_Tracker;
END ARCHITECTURE;
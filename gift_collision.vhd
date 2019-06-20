-- Gift Collision Block

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY gift_collision IS
	PORT(
		ball_Y_pos, gift_X_pos : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		gift_check : OUT std_logic
	);
END ENTITY;

ARCHITECTURE behaviour OF gift_collision IS
BEGIN
	PROCESS(ball_Y_pos, gift_X_pos)
	BEGIN
		IF(gift_X_pos >= 300 AND gift_X_pos <= 320) THEN
			IF(ball_Y_pos >= 220 AND ball_Y_pos <= 240) THEN
				gift_check <= '1';
			END IF;
		ELSE
			gift_check <= '0';
		END IF;
	END PROCESS;
END ARCHITECTURE;
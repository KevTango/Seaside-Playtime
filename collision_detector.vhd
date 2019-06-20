-- Pipe Collision Block

library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity collision_detector is
	port(
		Clk, pipe_enable						: in std_logic;
		lfsr_register, lfsr2_register							: in std_logic_vector(3 downto 0);
		ball_Y_pos, pipe_x_pos, pixel_row : in std_logic_vector(10 downto 0);
		left_click								: in std_logic;
		pipe2_x_pos				: in std_logic_vector(10 downto 0);
		output 					: out std_logic
	);
end entity collision_detector;

architecture behaviour of collision_detector is
signal collide : std_logic;
signal mouse_flag : std_logic;
begin
	process(ball_Y_pos, pipe_x_pos, pipe2_x_pos, mouse_flag, lfsr_register, lfsr2_register, left_click, collide)
	BEGIN
		IF(left_click = '1') THEN
			mouse_flag <= '1';
		END IF;
		
		IF((pipe_x_pos >= 300) AND (pipe_x_pos <= 320) AND (mouse_flag = '1')) THEN
			collide <= '0';
			CASE lfsr_register IS
				WHEN "0000" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 100) OR (ball_Y_pos > 160 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0001" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 125) OR (ball_Y_pos > 185 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0010" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 150) OR (ball_Y_pos > 210 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0011" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 175) OR (ball_Y_pos > 235 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0100" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 200) OR (ball_Y_pos > 260 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0101" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 225) OR (ball_Y_pos > 285 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0110" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 250) OR (ball_Y_pos > 310 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0111" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 275) OR (ball_Y_pos > 335 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1000" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 300) OR (ball_Y_pos > 360 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1001" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 100) OR (ball_Y_pos > 160 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1010" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 200) OR (ball_Y_pos > 260 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1011" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 300) OR (ball_Y_pos > 360 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1100" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 125) OR (ball_Y_pos > 185 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1101" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 275) OR (ball_Y_pos > 335 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1110" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 150) OR (ball_Y_pos > 210 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1111" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 250) OR (ball_Y_pos > 310 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN OTHERS =>
					collide <= '0';
			END CASE;
			
			ELSIF((pipe2_x_pos >= 300) AND (pipe2_x_pos <= 320) AND (mouse_flag = '1')) THEN
			collide <= '0';
			CASE lfsr2_register IS
				WHEN "0000" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 100) OR (ball_Y_pos > 160 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0001" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 125) OR (ball_Y_pos > 185 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0010" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 150) OR (ball_Y_pos > 210 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0011" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 175) OR (ball_Y_pos > 235 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0100" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 200) OR (ball_Y_pos > 260 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0101" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 225) OR (ball_Y_pos > 285 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0110" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 250) OR (ball_Y_pos > 310 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "0111" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 275) OR (ball_Y_pos > 335 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1000" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 300) OR (ball_Y_pos > 360 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1001" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 100) OR (ball_Y_pos > 160 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1010" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 200) OR (ball_Y_pos > 260 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1011" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 300) OR (ball_Y_pos > 360 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1100" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 125) OR (ball_Y_pos > 185 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1101" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 275) OR (ball_Y_pos > 335 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1110" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 150) OR (ball_Y_pos > 210 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN "1111" =>
					IF((ball_Y_pos > 0 AND ball_Y_pos < 250) OR (ball_Y_pos > 310 AND ball_Y_pos < 400)) THEN
						collide <= '1';
					END IF;
				WHEN OTHERS =>
					collide <= '0';
			END CASE;
		ELSE
			collide <= '0';
		END IF;
	output <= collide;
	end process;
end architecture behaviour;
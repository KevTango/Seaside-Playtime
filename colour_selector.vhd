library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity colour_selector is 
	port(
		 ball_on : in std_logic;
		 char_input, heart_input, score_input, game_over_input, start_screen_input, pause_input, ball_input : in std_logic_vector(11 downto 0);
		pipe_input, energy_input, ground_input, background_input, pipe2_input, gift_input : in std_logic_vector (2 downto 0);
		ball_red_input, ball_green_input, ball_blue_input : in std_logic;
		text_enable, heart_enable, score_enable, pipe_enable, energy_enable, ground, background, main_mode, training_mode, game_over, start_screen, pause_enable, pipe2_enable, gift_enable, add_level : in std_logic;
		red, green, blue    : out std_logic_vector(3 downto 0);
		new_background_input : in std_logic_vector(11 downto 0)
	);
end entity colour_selector;

architecture behaviour of colour_selector is 
begin
	process(char_input, heart_input, text_enable, heart_enable, ball_on, ball_red_input, ball_green_input, ball_blue_input, score_enable, score_input, pipe_enable, pipe_input, energy_enable, energy_input, ground, ground_input, background, background_input, main_mode, game_over, 
			start_screen, new_background_input, game_over_input, start_screen_input, pause_input, pause_enable, pipe2_enable, pipe2_input, gift_enable, gift_input, training_mode, add_level, ball_input)
	begin
		if (main_mode = '1' or training_mode = '1') then
			if (text_enable = '1') then
				if (char_input = "111111111111")then
				red <= char_input(11 downto 8);
				green <= char_input(7 downto 4);
				blue <= char_input(3 downto 0);
				else
				red <= new_background_input(11 downto 8);
				green <= new_background_input(7 downto 4);
				blue <= new_background_input(3 downto 0);
				end if;
			elsif (heart_enable = '1') then
				if (heart_input = "000000000000") then
				red <= new_background_input(11 downto 8);
				green <= new_background_input(7 downto 4);
				blue <= new_background_input(3 downto 0);
				else
				red <= "1111";
				green <= "0000";
				blue <= "0000";
				end if;
			elsif (ball_on = '1') then
			if (add_level = '0') then
				red <= ball_input(11 downto 8);
				green <= ball_input(7 downto 4);
				blue <= ball_input(3 downto 0);
			elsif (add_level = '1') then
				red <= not ball_input(11 downto 8);
				green <= not ball_input(7 downto 4);
				blue <= not ball_input(3 downto 0);
			else
				red <= not ball_input(11 downto 8);
				green <= ball_input(7 downto 4);
				blue <= not ball_input(3 downto 0);
			end if;
			elsif (gift_enable= '1') then
				red <= "111" & gift_input(2);
				green <= "111" & gift_input(1);
				blue <= "111" & gift_input(0);
			elsif (score_enable = '1') then
				if (score_input = "111111111111")then
				red <= score_input(11 downto 8);
				green <= score_input(7 downto 4);
				blue <= score_input(3 downto 0);
				else
				red <= new_background_input(11 downto 8);
				green <= new_background_input(7 downto 4);
				blue <= new_background_input(3 downto 0);
				end if;
			elsif (pipe_enable = '1') then
				red <= "000" & pipe_input(2);
				green <= "111" & pipe_input(1);
				blue <= "000" & pipe_input(0);
			elsif (pipe2_enable = '1') then
				red <= "000" & pipe2_input(2);
				green <= "111" & pipe2_input(1);
				blue <= "000" & pipe2_input(0);
			elsif (energy_enable = '1') then
				red <= "000" & energy_input(2);
				green <= "000" & energy_input(1);
				blue <= "111" & energy_input(0);
			elsif (ground = '1') then
				red <= "1101";
				green <= "1011";
				blue <= "1000";
--			elsif (background = '1') then
--				red <= background_input(2);
--				green <= background_input(1);
--				blue <= background_input(0);
			else
				red <= new_background_input(11 downto 8);
				green <= new_background_input(7 downto 4);
				blue <= new_background_input(3 downto 0);
			end if;
		elsif (game_over = '1') then
				red <= game_over_input(11 downto 8);
				green <= game_over_input(7 downto 4);
				blue <= game_over_input(3 downto 0);
		elsif (start_screen = '1') then
			if(start_screen_input = "000000000000") then
				red <= new_background_input(11 downto 8);
				green <= new_background_input(7 downto 4);
				blue <= new_background_input(3 downto 0);
			else
				red <= start_screen_input(11 downto 8);
				green <= start_screen_input(7 downto 4);
				blue <= start_screen_input(3 downto 0);
			end if;
		elsif (pause_enable = '1') then
				red <= pause_input(11 downto 8);
				green <= pause_input(7 downto 4);
				blue <= pause_input(3 downto 0);
		else
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		end if;
			
	end process;
end architecture;
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;


entity flappybird_fsm is
	port (
		Reset, Main_menu_flag, Training_mode_flag, Game_over_flag, Clk : in std_logic;
		Output : out std_logic_Vector(4 downto 0);
		game_reset : out std_logic
	);
end entity flappybird_fsm;

architecture behaviour of flappybird_fsm is 
type state_type is (Start, main_mode, training_mode, game_over);
signal state, next_state : state_type;
begin

next_State_choice:process(Clk, state)
begin
	if Clk'event and Clk = '1' then
		state <= next_state;
	end if;
end process next_state_choice;

state_change:process(Reset, Main_menu_flag, Training_mode_flag, Game_over_flag, state, next_State, Clk)
begin
	if (Clk'event and Clk = '1') then
	case next_state is
		when Start =>
			if (main_menu_flag = '1') then
				next_state <= main_mode;
			elsif (training_mode_flag = '1') then
				next_state <= training_mode;			
			else
				next_State <= start;	
			end if;
		when main_mode =>
				if (game_over_flag = '1') then
					next_state <= game_over;
				else
					next_state <= main_mode;
				end if;
		when training_mode =>
				if (game_over_flag = '1') then
					next_state <= game_over;
				else
					next_state <= training_mode;
				end if;
		when game_over =>
			if (reset = '1')then
				next_state <= start;
			else
			next_state <= game_over;
			end if;
				
	end case;
	end if;
end process state_change;

state_output: process(State)
begin
	case state is
		when start =>
			output <= "10000";
		when main_mode =>
			output <= "01000";
		when training_mode =>
			output <= "00100";
		when game_over =>
			output <= "00010";
		when others =>
			output <= "00000";
	end case;
end process state_output;

state_output_two: process(state)
begin
	case state is
		when start =>
			game_reset <= '1';
		when main_mode =>
			game_reset <= '0';
		when training_mode =>
			game_reset <= '0';
		when game_over =>
			game_reset <= '0';
		when others =>
			game_reset <= '0';
	end case;
end process state_output_two;
end architecture behaviour;
		

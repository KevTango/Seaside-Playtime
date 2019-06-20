library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity ball_display is
	port(
		ball_x_pos, ball_y_pos : in std_logic_Vector(10 downto 0);
		Clk, ball_enable : in std_logic;
		char_add : out std_logic_vector(5 downto 0);
		char_row, char_col : out std_logic_vector(2 downto 0)
	);
end entity ball_display;

architecture behaviour of ball_display is
begin 
process(Clk, ball_enable)
begin
	if (Clk'event and Clk = '1')then
		if (ball_enable = '1') then
			char_add <= "100111";
			char_row <= ball_x_pos(2 downto 0);
			char_col <= ball_y_pos(2 downto 0);
		end if;
	end if;
end process;
end architecture;
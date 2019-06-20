library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity four_bit_colour is
	port(
		red, green, blue, background_enable	: in std_logic;
		new_background_red, new_background_green, new_background_blue : in std_logic_vector(3 downto 0); 
		red_output, green_output, blue_output : out std_logic_vector (3 downto 0)
	);
end entity four_bit_colour;

architecture behaviour of four_bit_colour is
begin
red_colour:process(red)
begin
	if background_enable = '0' then
		if (red = '1') then
			red_output <= "1111";
		else 
			red_output <= "0000";
		end if;
	else
		red_output <= new_background_red;
	end if;
end process red_colour;

green_colour:process(green)
begin
	if background_enable = '0' then
		if (green = '1') then
			green_output <= "1111";
		else
			green_output <= "0000";
		end if;
	else
		green_output <= new_background_green;
	end if;
end process green_colour;

blue_colour: process(blue)
begin	
	if background_enable = '0' then
		if (blue = '1')then
			blue_output <= "1111";
		else	
			blue_output <= "0000";
		end if;
	else
		blue_output <= new_background_blue;
	end if;
end process blue_colour;
end architecture behaviour;
		
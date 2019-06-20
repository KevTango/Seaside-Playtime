-- debouncer.vhd
-- This process checks to see if a button is pressed for longer than 50ms then registers it
-- Author: Group 9
-- Date last modified: 27/09/2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debouncer is
	port (
		-- Inputs
		clk : in std_logic; -- clock
		button : in std_logic; -- button
		
		-- Output
		output : out std_logic -- result
	);
end entity;

architecture behaviour of debouncer is
	-- As the DE0 Board frequency is 50 MHz.
	-- Once the button is held for at least 500 ms, the amount of bits is 76,800.
	-- 50MHz * 500ms = 25,000,000
	signal count : std_logic_vector(5 downto 0) := "000000";
begin
	process(clk, button, count)
	variable t_output : std_logic := '0';
	begin
		if(falling_edge(clk)) then -- Should be falling edge
			
			-- If the button is pressed and the count is less than 25,000,001, increment count
			if(button = '0' and count < "100000") then
				count <= count + 1; 
			
			-- If the count is 25,000,000, then output should be high and reset count
			elsif(count = "100000") then
				t_output := '1';
				count <= "000000";
			
			-- If the button is not pressed, reset count and output
			elsif(button = '1') then
				count <= "000000";
				t_output := '0';
			end if;
		end if;
		output <= std_logic(t_output);
	end process;
end behaviour;			
-- This code configures a 3-bit LFSR for the COMPSYS 305 Mini-Project
-- Author: Kevin Tang
-- Date Created: 18/05/2019

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity three_bit_lfsr2 is
	port(Clk: in std_logic;
		Count : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behaviour of three_bit_lfsr2 is
begin
	process(Clk)
		variable	t_Count : std_logic_vector(3 downto 0) := "0111";
	begin
		if(clk'event AND clk = '1') then
			t_Count := t_Count(2 downto 0) & t_Count(3);
			t_Count(2) := t_Count(1) XOR t_Count(3);
			if(t_Count = "0000") then
				t_Count := "1110";
			end if;
			Count <= t_Count;
		end if;
	end process;
end architecture;
-- Two-bit LFSR

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity two_bit_lfsr is
	port(Input: in std_logic;
		Count : out std_logic_vector(1 downto 0)
	);
end entity;

architecture behaviour of two_bit_lfsr is
begin
	process(Input)
		variable	t_Count : std_logic_vector(1 downto 0) := "00";
	begin
		if(Input'event AND Input = '1') then
			case t_Count is
				when "00" =>
					t_count := "01";
				when "01" =>
					t_count := "10";
				when "10" =>
					t_count := "11";
				when "11" =>
					t_count := "00";
			end case;
		end if;
		Count <= t_Count;
	end process;
end architecture;
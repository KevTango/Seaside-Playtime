LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;
use ieee.numeric_std.all;

entity score_count is
	port(
		pipe_x_pos : in std_logic_vector(10 downto 0);
		vert_sync : in std_logic;
		output : out std_logic
	);
end entity score_count;

architecture behaviour of score_count is
begin 
process(vert_sync)
begin
	if (vert_sync'event and vert_sync = '1')then
		if (pipe_x_pos + 12 = 320) then
			output <= '1';
		else
			output <= '0';
		end if;
	end if;
end process;
end architecture;
library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity comparator is 
	port(
		input : in std_logic;
		output : out std_logic
	);
end entity comparator;

architecture behaviour of comparator is
begin
	process(input)
	begin
		if (input'event and input = '0') then
			output <= '1';
	end if;
	end process;
end architecture;
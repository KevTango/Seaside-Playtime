library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity score_upcounter is
port(
	clk : in std_logic;
	score_input : in std_logic;
	output : out std_logic_vector(10 downto 0)
);
end entity score_upcounter;

architecture behaviour of score_upcounter is
begin

process(Clk, score_input)
variable temp_output : std_logic_vector(10 downto 0) := "00000000000";
begin
	if (Clk'event and clk = '1')then
		if (score_input = '1') then
			if (temp_output = "11111111111") then
				temp_output := "00000000000";
			else
				temp_output := temp_output + 1;
			end if;
		else
			temp_output := temp_output;
		end if;
	end if;
	output <= temp_output;
end process;
end architecture;
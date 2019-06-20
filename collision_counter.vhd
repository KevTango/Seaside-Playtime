library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity collision_counter is
	port (
		collision_detect, Clk : in std_logic;
		collision_enable : out std_logic
	);
end entity collision_counter;

architecture behaviour of collision_counter is
begin 
process(collision_detect,Clk)
variable v_count : std_logic_vector(4 downto 0);
begin
	if (collision_detect = '0') then
		collision_enable <= '1';
		v_count := "00000";
	elsif (collision_detect = '1') then
		if (Clk'event and Clk = '1') then
			if (v_count = "11111") then
				v_count := "00000";
				collision_enable <= '1';
			else
				v_count := v_count + 1;
				collision_enable <= '0';
			end if;
		end if;
	end if;
end process;
end architecture behaviour;
		
		
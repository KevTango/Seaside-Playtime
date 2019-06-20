library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;


entity char_display is
	port(
		pixel_row, pixel_column : in std_logic_vector(10 downto 0);
		Clk      					: in std_logic;
		Output 						: out std_logic_vector(5 downto 0);
		enable 						: out std_logic
	);
end entity char_display;

architecture behaviour of char_display is
begin
process(Clk, pixel_column, pixel_row)
	begin
		if(pixel_row >= 0 and pixel_row < 16 and pixel_column >= 0 and pixel_column < 16) then
			Output <= "010011";
			enable <= '1';
		elsif(pixel_row >= 0 and pixel_row < 16 and pixel_column >= 16 and pixel_column < 32) then
			Output <= "000011";
			enable <= '1';
		elsif(pixel_row >= 0 and pixel_row < 16 and pixel_column >= 32 and pixel_column < 48) then
			Output <= "001111";
			enable <= '1';
		elsif(pixel_row >= 0 and pixel_row < 16 and pixel_column >= 48 and pixel_column < 64) then
			Output <= "010010";
			enable <= '1';
		elsif(pixel_row >= 0 and pixel_row < 16 and pixel_column >= 64 and pixel_column < 80) then
			Output <= "000101";
			enable <= '1';
		else
			output <= "000000";
			enable <= '0';
		end if;
end process;
end architecture;
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity game_over is
	port(
		pixel_row, pixel_column : in std_logic_vector(10 downto 0);
		Clk, Enable : in std_logic;
		Ones, Tens, Hundreds, Thousands : in std_logic_vector(5 downto 0);
		char_add  : out std_logic_vector(5 downto 0);
		char_col, char_row : out std_logic_vector(2 downto 0)
	);
end entity game_over;

architecture behaviour of game_over is
begin
process(Clk, pixel_row, pixel_column, enable, thousands, hundreds, tens, ones)
begin
	if (enable = '1') then
		if (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "000111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "000001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "001101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 336 and pixel_column < 352 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 176 and pixel_row < 192) then
			char_add <= "001111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 176 and pixel_row < 192) then
			char_add <= "010110";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 176 and pixel_row < 192) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif (pixel_column >= 336 and pixel_column < 352 and pixel_row >= 176 and pixel_row < 192) then
			char_add <= "010010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 240 and pixel_column < 256) then
			char_add <= "010011";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 256 and pixel_column < 272) then
			char_add <= "000011";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 272 and pixel_column < 288) then
			char_add <= "001111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 288 and pixel_column < 304) then
			char_add <= "010010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 304 and pixel_column < 320) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 224 and pixel_column < 240) then
			char_add <= "100000";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 208 and pixel_column < 224) then
			char_add <= "010010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 192 and pixel_column < 208) then
			char_add <= "010101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 176 and pixel_column < 192) then
			char_add <= "001111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 160 and pixel_column < 176) then
			char_add <= "011001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 336 and pixel_column < 352) then
			char_add <= Thousands;
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 352 and pixel_column < 368) then
			char_add <= Hundreds;
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 368 and pixel_column < 384) then
			char_add <= Tens;
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		elsif(pixel_row >= 208 and pixel_row < 224 and pixel_column >= 384 and pixel_column < 400) then
			char_add <= Ones;
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
		else
			char_row <= "000";
			char_col <= "000";
		end if;
	else
		char_row <= "000";
		char_col <= "000";
	end if;

end process;
end architecture behaviour;
		
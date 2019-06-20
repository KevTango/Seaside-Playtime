library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity start_screen is
	port(
		pixel_row, pixel_column : in std_logic_vector(10 downto 0);
		Clk, Enable : in std_logic;
		background_input : in std_logic_vector(11 downto 0);
		startscreen_output : out std_logic_vector(11 downto 0)
	);
end entity start_screen;

architecture behaviour of start_screen is
component char_rom
		PORT(	
		character_address		:	IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		font_row, font_col	:	IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		clock						: 	IN STD_LOGIC;
		rom_mux_output			:	OUT STD_LOGIC_vector(11 downto 0)
	);
	end component;
signal char_add : std_logic_vector(5 downto 0);
signal char_row, char_col : std_logic_vector(2 downto 0);
signal rom_mux : std_logic_vector(11 downto 0);
signal sel : std_logic;
begin
	Char: char_rom
		port map (clock => clk, character_address => char_add, font_row => char_row, font_col => char_col, rom_mux_output => rom_mux);
process(Clk, pixel_row, pixel_column, enable)
begin
	if (enable = '1') then
		if (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "010011";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "000001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 336 and pixel_column < 352 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "010011";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 352 and pixel_column < 368 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "001001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 368 and pixel_column < 384 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "000100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 384 and pixel_column < 400 and pixel_row >= 144 and pixel_row < 160) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		-------seaside
		elsif (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "010000";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "001100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "000001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 336 and pixel_column < 352 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "011001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 352 and pixel_column < 368 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "010100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 368 and pixel_column < 384 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "001001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 384 and pixel_column < 400 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "001101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 400 and pixel_column < 416 and pixel_row >= 160 and pixel_row < 176) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
			----------------------------------------------------------------------------------------------
		elsif (pixel_column >= 144 and pixel_column < 160 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "000010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 160 and pixel_column < 176 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "010100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 176 and pixel_column < 192 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "110000";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 208 and pixel_column < 224 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "001101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 224 and pixel_column < 240 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "000001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 240 and pixel_column < 256 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "001001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 256 and pixel_column < 272 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "001110";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "001101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "001111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "000100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 336 and pixel_column < 352 and pixel_row >= 288 and pixel_row < 304) then
			char_add <= "000101";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
	-------------------------------------------------------------------------------------------------------------
		elsif (pixel_column >= 144 and pixel_column < 160 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "000010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 160 and pixel_column < 176 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "010100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 176 and pixel_column < 192 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "110001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 208 and pixel_column < 224 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "010100";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 224 and pixel_column < 240 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "010010";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 240 and pixel_column < 256 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "000001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 256 and pixel_column < 272 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "001001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 272 and pixel_column < 288 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "001110";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 288 and pixel_column < 304 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "001001";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 304 and pixel_column < 320 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "001110";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		elsif (pixel_column >= 320 and pixel_column < 336 and pixel_row >= 304 and pixel_row < 320) then
			char_add <= "000111";
			char_row <= pixel_row(3 downto 1);
			char_col <= pixel_column(3 downto 1);
			sel <= '1';
		else
			sel <= '0';
		end if;
	else
		char_row <= "000";
		char_col <= "000";
	end if;
end process;

process (Clk, Sel, background_input, rom_mux)
begin
	case sel is
		when '0' => startscreen_output <= background_input;
		when '1' => startscreen_output <= rom_mux;
	end case;
end process;
end architecture behaviour;
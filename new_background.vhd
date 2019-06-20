library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library altera_mf;
use altera_mf.all;

entity new_background is
	port(
		pixel_row, pixel_col : in std_logic_vector(10 downto 0);
		clock : in std_logic;
		rom_mux_output : out std_logic_vector(11 downto 0)
	);
end entity new_background;

architecture behaviour of new_background is 

component background_rom 
	PORT (
			clock : in std_logic;
			address : in std_logic_vector(14 downto 0);
			q : out std_logic_vector (11 downto 0)
	);
END COMPONENT;

signal rom_data : std_logic_vector(11 downto 0);
signal rom_address : std_logic_vector(14 downto 0);

begin 
	background_game : background_rom
		port map ( clock => clock, address => rom_address, q => rom_data);
		
		rom_address <= pixel_col(9 downto 2) + conv_std_logic_vector((conv_integer(pixel_row(9 downto 2))*160),15);
		rom_mux_output <= rom_data;
end architecture behaviour;
	
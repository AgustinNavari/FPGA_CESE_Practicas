-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity regDesp4b_tb is
end;

-- Cuerpo de arquitectura

architecture regDesp4b_tb_arq of regDesp4b_tb is

	-- Parte declarativa

	constant T: time := 20 ns;

	signal clk_tb:     std_logic   := '0';
	signal rst_tb:     std_logic   := '0';
	signal ena_tb:     std_logic   := '1';
	signal serie_i_tb: std_logic   := '1';
	signal serie_o_tb: std_logic;

begin

	-- Parte descriptiva

	clk_tb <= not clk_tb after T/2;
	serie_i_tb <= '0' after 25 ns, '1' after 50 ns;

	DUT: entity work.regDesp4b

		port map(
			clk_i   => clk_tb,
			rst_i   => rst_tb,
			ena_i   => ena_tb,
			serie_i => serie_i_tb, 
			serie_o => serie_o_tb
			);
end;


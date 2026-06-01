-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity ffd_tb is
end;

-- Cuerpo de arquitectura

architecture ffd_tb_arq of ffd_tb is

	-- Parte declarativa

	component ffd is
		port(

			clk_i: in  std_logic;
			rst_i: in  std_logic;
			ena_i: in  std_logic;
			d_i:   in  std_logic;
			q_o:   out std_logic
		);
	end component;

	constant T: time := 20 ns;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '1';
	signal d_tb: std_logic := '0';
	signal q_tb:   std_logic;	


begin

	-- Parte descriptiva

	clk_tb <= not clk_tb after T/2;
	d_tb <= '1' after 60 ns, '0' after 100 ns, '1' after 145 ns;
	ena_tb <= '0' after 105 ns, '1' after 120 ns;
	rst_tb <= '1' after 155 ns;

	DUT: ffd

		port map(
			clk_i  => clk_tb,
			rst_i  => rst_tb,
			ena_i => ena_tb,
			d_i  => d_tb,
			q_o => q_tb
			);
end;


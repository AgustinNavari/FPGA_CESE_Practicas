-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- Declaracion de entidad

entity contBCD_tb is
end;

-- Cuerpo de arquitectura

architecture contBCD_tb_arq of contBCD_tb is

	-- Parte declarativa

	constant T: time := 20 ns;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal max_tb: std_logic;
	signal q_tb:   std_logic_vector(3 downto 0);	

begin

	-- Parte descriptiva

	clk_tb <= not clk_tb after T/2;
	ena_tb <= '0' after 105 ns, '1' after 120 ns;
	rst_tb <= '0' after 20 ns;

	DUT: entity work.contBCD

		port map(
			clk_i  => clk_tb,
			rst_i  => rst_tb,
			ena_i => ena_tb,
			max_o  => max_tb,
			q_o => q_tb
			);
end;


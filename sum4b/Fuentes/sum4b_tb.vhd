-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity sum4b_tb is
end;

-- Cuerpo de arquitectura

architecture sum4b_tb_arq of sum4b_tb is

	-- Parte declarativa

	component sum4b is
		port(
			a_i:  in  std_logic_vector(3 downto 0);
			b_i:  in  std_logic_vector(3 downto 0);
			ci_i: in  std_logic;
			s_o:  out std_logic_vector(3 downto 0);
			co_o: out std_logic
			);
	end component;


	signal a_tb: std_logic_vector(3 downto 0) := "0100";
	signal b_tb: std_logic_vector(3 downto 0) := "0001";
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(3 downto 0);
	signal co_tb: std_logic;


begin

	-- Parte descriptiva

	a_tb <= "0010" after 100 ns, "0011" after 200 ns,  "0111" after 300 ns;
	b_tb <= "0101" after 150 ns, "1010" after 250 ns;
	ci_tb <= '1' after 350 ns;

	DUT: sum4b

		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
			);
end;


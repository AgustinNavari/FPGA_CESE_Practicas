-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity sumNb_tb is
end;

-- Cuerpo de arquitectura

architecture sumNb_tb_arq of sumNb_tb is

	-- Parte declarativa

	constant N_tb: natural := 5;

	component sumNb is

	generic(
		N: natural := 4
	);

	port(
		a_i:  in  std_logic_vector(N-1 downto 0);
		b_i:  in  std_logic_vector(N-1 downto 0);
		ci_i: in  std_logic;
		s_o:  out std_logic_vector(N-1 downto 0);
		co_o: out std_logic
		);

	end component;


	signal a_tb: std_logic_vector(N_tb-1 downto 0) := "00100";
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := "00001";
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;


begin

	-- Parte descriptiva

	a_tb <= "00010" after 100 ns, "00011" after 200 ns,  "01101" after 300 ns;
	b_tb <= "01001" after 150 ns, "10100" after 250 ns;
	ci_tb <= '1' after 350 ns;

	DUT: sumNb

		generic map(
			N => N_tb
		)

		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
			);
end;


-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity sumNb is

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
end;

-- Cuerpo de arquitectura

architecture sumNb_arq of sumNb is

	-- Parte declarativa

	component sum1b is
		port(
		a_i:  in std_logic;
		b_i:  in std_logic;
		ci_i: in std_logic;
		s_o:  out std_logic;
		co_o: out std_logic
		);
	end component;

	signal aux: std_logic_vector(N downto 0);

begin

	-- Parte descriptiva

	aux(0) <= ci_i;
	co_o   <= aux(N);

	sum_Nb_gen: for i in 0 to N-1 generate

		sumNb_i: sum1b
			port map(
			a_i  => a_i(i),
			b_i  => b_i(i),
			ci_i => aux(i),
			s_o  => s_o(i),
			co_o => aux(i+1)
		);
	end generate;
	
end;


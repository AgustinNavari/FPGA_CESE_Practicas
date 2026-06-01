-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity sum4b is
	port(
		a_i:  in  std_logic_vector(3 downto 0);
		b_i:  in  std_logic_vector(3 downto 0);
		ci_i: in  std_logic;
		s_o:  out std_logic_vector(3 downto 0);
		co_o: out std_logic
		);
end;

-- Cuerpo de arquitectura

architecture sum4b_arq of sum4b is

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

	signal aux: std_logic_vector(4 downto 0);

begin

	-- Parte descriptiva

	aux(0) <= ci_i;
	co_o   <= aux(4);

	sum1b_inst0: sum1b
		port map(
			a_i  => a_i(0),
			b_i  => b_i(0),
			ci_i => aux(0),
			s_o  => s_o(0),
			co_o => aux(1)
		);

	sum1b_inst1: sum1b
		port map(
			a_i  => a_i(1),
			b_i  => b_i(1),
			ci_i => aux(1),
			s_o  => s_o(1),
			co_o => aux(2)
		);

	sum1b_inst2: sum1b
		port map(
			a_i  => a_i(2),
			b_i  => b_i(2),
			ci_i => aux(2),
			s_o  => s_o(2),
			co_o => aux(3)
		);

	sum1b_inst3: sum1b
		port map(
			a_i  => a_i(3),
			b_i  => b_i(3),
			ci_i => aux(3),
			s_o  => s_o(3),
			co_o => aux(4)
		);

end;


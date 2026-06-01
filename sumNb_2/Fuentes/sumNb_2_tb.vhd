-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity sumNb_2_tb is
end;

-- Cuerpo de arquitectura

architecture sumNb_2_tb_arq of sumNb_2_tb is

	-- Parte declarativa

	constant N_tb: natural := 5;

	component sumNb_2 is

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


	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(4,N_tb));
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(4,N_tb));
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;


begin

	-- Parte descriptiva

	a_tb <= std_logic_vector(to_unsigned(2,N_tb)) after 100 ns,
	        std_logic_vector(to_unsigned(3,N_tb)) after 200 ns,
	        std_logic_vector(to_unsigned(7,N_tb)) after 300 ns;

	b_tb <= std_logic_vector(to_unsigned(5,N_tb)) after 150 ns,
	        std_logic_vector(to_unsigned(18,N_tb)) after 250 ns;

	ci_tb <= '1' after 350 ns;

	DUT: sumNb_2

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


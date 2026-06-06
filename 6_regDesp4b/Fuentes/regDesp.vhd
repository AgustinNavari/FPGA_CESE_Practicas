-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity regDesp4b is
	port(

		clk_i:     in  std_logic;
		rst_i:     in  std_logic;
		ena_i:     in  std_logic;
		serie_i:   in  std_logic;
		serie_o:   out std_logic
	);
end;

-- Cuerpo de arquitectura

architecture regDesp4b_arq of regDesp4b is
	-- Parte declarativa

	signal aux: std_logic_vector(3 downto 0);

begin
	--Parte descriptiva

	serie_o <= aux(3);

    ffd_0: entity work.ffd
	    port map(
	        clk_i => clk_i,
	        rst_i => rst_i,
	        ena_i => ena_i,
	        d_i   => serie_i,
	        q_o   => aux(0)
	    );

    ffd_1: entity work.ffd
	    port map(
	        clk_i => clk_i,
	        rst_i => rst_i,
	        ena_i => ena_i,
	        d_i   => aux(0),
	        q_o   => aux(1)
	    );

    ffd_2: entity work.ffd
	    port map(
	        clk_i => clk_i,
	        rst_i => rst_i,
	        ena_i => ena_i,
	        d_i   => aux(1),
	        q_o   => aux(2)
	    );

    ffd_3: entity work.ffd
	    port map(
	        clk_i => clk_i,
	        rst_i => rst_i,
	        ena_i => ena_i,
	        d_i   => aux(2),
	        q_o   => aux(3)
	    );

end;
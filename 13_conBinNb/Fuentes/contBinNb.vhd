-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity contBin4b is

    generic(
        N : natural := 4 -- por defecto contador de 4 bits
    );

	port(
		ena_i:  in  std_logic;
		rst_i:  in  std_logic;
		clk_i:  in  std_logic;
		q_o:    out std_logic_vector(N-1 downto 0)
		);
end;

-- Cuerpo de arquitectura

architecture contBin4b_arq of contBin4b is

	-- Parte declarativa

	signal q: unsigned(N-1 downto 0);

begin

	-- Parte descriptiva

	q_o <= std_logic_vector(q);

	cont4b_desc: process(clk_i)
	begin

		if rising_edge(clk_i) then

			if rst_i = '1' then
				q <= (others => '0');

			elsif ena_i = '1' then
				q <= q + 1;

			end if;
		end if;
	end process;

end;


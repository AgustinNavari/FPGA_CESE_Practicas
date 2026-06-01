-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de entidad

entity reg is

	generic(
		N: natural := 4
	);	
	port(

		clk_i: in  std_logic;
		rst_i: in  std_logic;
		ena_i: in  std_logic;
		d_i:   in  std_logic_vector(N-1 downto 0);
		q_o:   out std_logic_vector(N-1 downto 0)
	);
end;

-- Cuerpo de arquitectura

architecture reg_arq of reg is
	-- Parte declarativa

begin
	--Parte descriptiva

	reg_desc: process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
				q_o <= (others => '0'); -- (N-1 downto 0 => '0')

			elsif ena_i = '1' then
				q_o <= d_i;
			end if;
		end if;
	end process;

end;
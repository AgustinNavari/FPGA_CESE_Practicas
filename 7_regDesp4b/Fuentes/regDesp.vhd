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

	regDesp4b_desc: process(clk_i)
	begin

	if rising_edge(clk_i) then
		if rst_i = '1' then
			aux <= "0000";

		elsif ena_i = '1' then
			aux(0) <= serie_i;
			aux(1) <= aux(0);
			aux(2) <= aux(1);
			aux(3) <= aux(2);
			end if;

		end if;

	end process;

end;
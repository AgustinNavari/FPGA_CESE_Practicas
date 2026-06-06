-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity enaGen is

	generic(
        N : natural := 10
    );

	port(
		ena_i:  in  std_logic;
		rst_i:  in  std_logic;
		clk_i:  in  std_logic;
		ena_o:  out std_logic
		);
end;

-- Cuerpo de arquitectura

architecture enaGen_arq of enaGen is

	-- Parte declarativa

	signal count : integer range 0 to N-1 := 0;

begin

	-- Parte descriptiva

    enaGen_desc: process(clk_i)
    begin
        if rising_edge(clk_i) then

            if rst_i = '1' then
                count <= 0;
                ena_o <= '0';

            elsif ena_i = '1' then

                if count = N-1 then
                    count <= 0;
                    ena_o <= '1';
                else
                    count <= count + 1;
                    ena_o <= '0';
                end if;

            else
                ena_o <= '0';

            end if;
        end if;
    end process;

end;


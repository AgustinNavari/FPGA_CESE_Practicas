-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity contBin4b_tb is
end;

-- Cuerpo de arquitectura

architecture contBin4b_tb of contBin4b_tb is

	-- Parte declarativa

	signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal ena_tb : std_logic := '0';
    signal q_tb   : std_logic_vector(3 downto 0);

begin

	-- Parte descriptiva

    DUT: entity work.contBin4b
        port map(
            clk_i => clk_tb,
            rst_i => rst_tb,
            ena_i => ena_tb,
            q_o   => q_tb
        );

    clk_tb <= not clk_tb after 10 ns;


    estimulos: process
    begin

	    -- Estado inicial
	    rst_tb <= '1';
	    ena_tb <= '0';
	    wait for 60 ns;

	    -- Saco reset y habilito la cuenta
	    rst_tb <= '0';
	    ena_tb <= '1';
	    wait for 200 ns;

	    -- Deshabilito: deberia mantener el valor
	    ena_tb <= '0';
	    wait for 80 ns;

	    -- Vuelvo a habilitar
	    ena_tb <= '1';
	    wait for 200 ns;

	    -- Reset en medio de la cuenta
	    rst_tb <= '1';
	    wait for 40 ns;

	    rst_tb <= '0';
	    wait for 100 ns;

	    wait;

	end process;

end;


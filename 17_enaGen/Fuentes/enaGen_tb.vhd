-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity enaGen_tb is
end;

-- Cuerpo de arquitectura

architecture enaGen_tb_arq of enaGen_tb is

	-- Parte declarativa

    constant N_tb : natural := 4;

    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal ena_tb : std_logic := '0';
    signal pulso_tb : std_logic;

begin

	-- Parte descriptiva

    DUT: entity work.enaGen
    generic map(
        N => N_tb
    )
    port map(
        clk_i => clk_tb,
        rst_i => rst_tb,
        ena_i => ena_tb,
        ena_o => pulso_tb
    );

    clk_tb <= not clk_tb after 10 ns;


    estimulos: process
    begin
        -- Reset inicial
        rst_tb <= '1';
        ena_tb <= '0';
        wait for 60 ns;

        -- Habilito el generador
        rst_tb <= '0';
        ena_tb <= '1';
        wait for 300 ns;

        -- Pauso el generador
        ena_tb <= '0';
        wait for 100 ns;

        -- Vuelvo a habilitar
        ena_tb <= '1';
        wait for 200 ns;

        -- Reset
        rst_tb <= '1';
        wait for 40 ns;

        rst_tb <= '0';
        wait for 100 ns; --simular hasta 800 ns

        wait;
    end process;


end;


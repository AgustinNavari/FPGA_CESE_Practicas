library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm_tb is
end entity;

architecture pwm_tb_arq of pwm_tb is

    constant N_tb : natural := 4;

    signal clk_tb  : std_logic := '0';
    signal rst_tb  : std_logic := '0';
    signal ena_tb  : std_logic := '0';
    signal duty_tb : std_logic_vector(N_tb-1 downto 0);
    signal pwm_tb  : std_logic;

begin

    DUT: entity work.pwm
        generic map(
            N => N_tb
        )
        port map(
            clk_i  => clk_tb,
            rst_i  => rst_tb,
            ena_i  => ena_tb,
            duty_i => duty_tb,
            pwm_o  => pwm_tb
        );

    -- Clock de 20 ns
    clk_tb <= not clk_tb after 10 ns;

    estimulos: process
    begin

        -- Reset inicial
        rst_tb  <= '1';
        ena_tb  <= '0';
        duty_tb <= std_logic_vector(to_unsigned(0, N_tb));
        wait for 60 ns;

        -- Habilito PWM con duty 25%
        rst_tb  <= '0';
        ena_tb  <= '1';
        duty_tb <= std_logic_vector(to_unsigned(4, N_tb));
        wait for 400 ns;

        -- Duty 50%
        duty_tb <= std_logic_vector(to_unsigned(8, N_tb));
        wait for 400 ns;

        -- Duty 75%
        duty_tb <= std_logic_vector(to_unsigned(12, N_tb));
        wait for 400 ns;

        -- Duty 0%
        duty_tb <= std_logic_vector(to_unsigned(0, N_tb));
        wait for 200 ns;

        -- Duty casi 100%
        duty_tb <= std_logic_vector(to_unsigned(15, N_tb));
        wait for 400 ns;

        -- Pausa
        ena_tb <= '0';
        wait for 100 ns;

        wait;

    end process;

end architecture;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm is
    generic(
        N : natural := 8
    );
    port(
        clk_i  : in  std_logic;
        rst_i  : in  std_logic;
        ena_i  : in  std_logic;
        duty_i : in  std_logic_vector(N-1 downto 0);
        pwm_o  : out std_logic
    );
end entity;

architecture pwm_arq of pwm is

    signal count_q : std_logic_vector(N-1 downto 0);
    signal count_d : std_logic_vector(N-1 downto 0);

    constant ONE : std_logic_vector(N-1 downto 0) :=
        std_logic_vector(to_unsigned(1, N));

begin

    -- Incrementador: count_d = count_q + 1
    inc_inst: entity work.sumNb
        generic map(
            N => N
        )
        port map(
            a_i  => count_q,
            b_i  => ONE,
            ci_i => '0',
            s_o  => count_d,
            co_o => open
        );

    -- Registro del contador
    count_reg_inst: entity work.reg
        generic map(
            N => N
        )
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            ena_i => ena_i,
            d_i   => count_d,
            q_o   => count_q
        );

    -- Comparador PWM
    pwm_o <= '1' when ena_i = '1' and unsigned(count_q) < unsigned(duty_i)
             else '0';

end architecture;
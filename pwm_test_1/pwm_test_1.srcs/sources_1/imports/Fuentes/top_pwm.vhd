library IEEE;
use IEEE.std_logic_1164.all;

entity top_pwm is
    port(
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        sw_i  : in  std_logic_vector(1 downto 0);
        led_o : out std_logic
    );
end entity;

architecture top_pwm_arq of top_pwm is

    constant N_PWM : natural := 2;

begin

    pwm_inst: entity work.pwm
        generic map(
            N => N_PWM
        )
        port map(
            clk_i  => clk_i,
            rst_i  => rst_i,
            ena_i  => '1',
            duty_i => sw_i,
            pwm_o  => led_o
        );

end architecture;
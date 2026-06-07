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

    signal count : unsigned(N-1 downto 0);
    signal duty  : unsigned(N-1 downto 0);

begin

    duty <= unsigned(duty_i);

    pwm_desc: process(clk_i)
    begin
        if rising_edge(clk_i) then

            if rst_i = '1' then
                count <= (others => '0');
                pwm_o <= '0';

            elsif ena_i = '1' then

                count <= count + 1;

                if count < duty then
                    pwm_o <= '1';
                else
                    pwm_o <= '0';
                end if;

            else
                pwm_o <= '0';

            end if;

        end if;
    end process;

end architecture;
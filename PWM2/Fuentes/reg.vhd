library IEEE;
use IEEE.std_logic_1164.all;

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

architecture reg_arq of reg is
begin

    reg_gen: for i in 0 to N-1 generate

        ffd_inst: entity work.ffd
            port map(
                clk_i => clk_i,
                rst_i => rst_i,
                ena_i => ena_i,
                d_i   => d_i(i),
                q_o   => q_o(i)
            );

    end generate;

end;
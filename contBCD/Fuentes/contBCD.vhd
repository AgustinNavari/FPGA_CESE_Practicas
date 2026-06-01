-- Inclusion de bibliotecas y paquetes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de entidad

entity contBCD is
	port(

		clk_i: in  std_logic;
		rst_i: in  std_logic;
		ena_i: in  std_logic;
		q_o:   out std_logic_vector;
		max_o: out std_logic
	);

end;

-- Cuerpo de arquitectura

architecture contBCD_arq of contBCD is
	-- Parte declarativa

	signal salOr,salAnd, salComp: std_logic;
	signal salSum, salReg: std_logic_vector(3 downto 0);

begin
	--Parte descriptiva

	salOr   <= rst_i or salAnd;
	salAnd  <= ena_i and salComp;
	salComp <= '1' when salReg = "1001" else '0';
	max_o   <= salComp;
	q_o     <= salReg;
	salSum  <= std_logic_vector(unsigned(salReg) + "0001");

	reg_inst: entity work.reg

		generic map(
			N => 4
		)
		port map(

			clk_i => clk_i,
			rst_i => salOr,
			ena_i => ena_i,
			d_i   => salSum,
			q_o   => salReg
		);
end;
# Arty Z7 Pin Assignments
############################
# On-board Buttons         #
############################
set_property -dict { PACKAGE_PIN M20  IOSTANDARD LVCMOS33 } [get_ports { sw_i[0] }]; #IO_L7N_T1_AD2N_35 Sch=SW0
set_property -dict { PACKAGE_PIN M19  IOSTANDARD LVCMOS33 } [get_ports { sw_i[1] }]; #IO_L7P_T1_AD2P_35 Sch=SW1
############################
# On-board led             #
############################

set_property -dict { PACKAGE_PIN R14    IOSTANDARD LVCMOS33 } [get_ports {led_o}]; #IO_L6N_T0_VREF_34 Sch=LED0

# CLK source 50 MHz
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports {clk_i}]
create_clock -period 20.000 -name clk_i -waveform {0.000 10.000} [get_ports {clk_i}]


# Rst Btn[3]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {rst_i}]
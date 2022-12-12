library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
LIBRARY work;	
	
	
entity top is
    port 
    (
       clk : in std_logic;
		 out_pwm : out std_logic;
		 out_sens : out std_logic;
		 reset_n : in std_logic;
		 cs_n, clk_adc :   out std_logic;
		 data_in  :   in std_logic
    );
end entity top;


architecture rtl of top is 
	component mehdi is
		port (
			clk_clk                                : in  std_logic                    := 'X'; -- clk
			f6_avalon_verin_0_conduit_end_out_pwm  : out std_logic;                           -- out_pwm
			f6_avalon_verin_0_conduit_end_out_sens : out std_logic;                           -- out_sens
			f6_avalon_verin_0_conduit_end_clk_adc  : out std_logic;                           -- clk_adc
			f6_avalon_verin_0_conduit_end_cs_n     : out std_logic;                           -- cs_n
			f6_avalon_verin_0_conduit_end_data_in  : in  std_logic                    := 'X'; -- data_in
			pio_0_external_connection_export       : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n                          : in  std_logic                    := 'X'  -- reset_n
		);
	end component mehdi;
	
	
begin



	u0 : component mehdi
		port map (
		clk_clk =>         clk,                        
		f6_avalon_verin_0_conduit_end_out_pwm  => out_pwm,         -- f6_avalon_verin_0_conduit_end.out_pwm
		f6_avalon_verin_0_conduit_end_out_sens => out_sens,           --                              .out_sens
		f6_avalon_verin_0_conduit_end_clk_adc  => clk_adc,        --                              .clk_adc
		f6_avalon_verin_0_conduit_end_cs_n  => cs_n,            --                       .cs_n
		f6_avalon_verin_0_conduit_end_data_in  => data_in,      --                              .data_in
		--pio_0_external_connection_export       : out std_logic_vector(7 downto 0);        --     pio_0_external_connection.export
		reset_reset_n       => reset_n                                       --                         reset.reset_n
		);




end rtl;
	
	


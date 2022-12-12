
module mehdi (
	clk_clk,
	f6_avalon_verin_0_conduit_end_out_pwm,
	f6_avalon_verin_0_conduit_end_out_sens,
	f6_avalon_verin_0_conduit_end_clk_adc,
	f6_avalon_verin_0_conduit_end_cs_n,
	f6_avalon_verin_0_conduit_end_data_in,
	pio_0_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output		f6_avalon_verin_0_conduit_end_out_pwm;
	output		f6_avalon_verin_0_conduit_end_out_sens;
	output		f6_avalon_verin_0_conduit_end_clk_adc;
	output		f6_avalon_verin_0_conduit_end_cs_n;
	input		f6_avalon_verin_0_conduit_end_data_in;
	output	[7:0]	pio_0_external_connection_export;
	input		reset_reset_n;
endmodule

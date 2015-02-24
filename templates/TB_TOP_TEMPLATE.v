/*====================================

     MODULE : tb_@TOP_MODULE@
     AUTHOR : @AUTHOR@

====================================*/
`timescale 1ns/1ps

module tb_@TOP_MODULE@;


//=====================================
//
//          PARAMETERS 
//
//=====================================
parameter HP_CLK = 50; // Half period of Clock


//=====================================
//
//          I/O PORTS 
//
//=====================================
reg        rstn     ; 
reg        clk      ;


//=====================================
//
//         VARIABLES, NETS AND SIGNALS 
//
//=====================================


//=====================================
//
//          PORT MAPPING
//
//=====================================
// uud0
@TOP_MODULE@ uut0_@TOP_MODULE@(
	.rstn     (rstn    ),
	.clk      (clk     )
);


//=====================================
//
//          STIMULUS
//
//=====================================
// clock generation
initial begin
	clk = 1'b0;
	forever clk = #(HP_CLK) ~clk;
end

// reset generation
initial begin
	rstn = 1'b1;
	@(posedge clk)
	@(negedge clk)
	rstn = 1'b0;
	repeat(2) @(negedge clk);
	rstn = 1'b1;
end

// input generation
initial begin
	$display("===== SIM START =====");
	// insert your code ...
	$display("=====  SIM END  =====");
	$finish;
end

// monitoring 
always @(posedge clk) begin
	// example
	//$display("[monitor] i_cnt_en=%u,o_cnt=%u @%6dns", i_cnt_en, o_cnt, $time); 
end

// vcd dump
initial begin
	$dumpfile("dump/sim_tb_@TOP_MODULE@.vcd");
	$dumpvars(0, tb_@TOP_MODULE@);
end

endmodule



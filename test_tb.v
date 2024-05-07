`timescale 1ns / 1ps

module test_tb;

    reg [15:0] inDR;
	reg LD,CLK,INR,CLR;

	wire  [15:0] DR;

	test test (
		.inDR(inDR), 
		.DR(DR), 
		.LD(LD), 
		.CLR(CLR), 
		.CLK(CLK), 
		.INR(INR)
    );
    
    initial begin
    inDR=16h0000;
    LD=0;
    CLK=0;
    INR=0;
    CLR=0;
    #10 
    inDR=16h0000;
    LD=0;
    CLK=0;
    INR=0;
    CLR=0;
    #10 
    inDR=16h0000;
    LD=0;
    CLK=0;
    INR=0;
    CLR=0;
    #10 
    inDR=16h0000;
    LD=0;
    CLK=0;
    INR=0;
    CLR=0;
    #10
    end
    
endmodule

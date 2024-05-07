`timescale 1ns / 1ps

module counter(
    input  CLK,
	output reg [2:0] tcounts
    );
    
    always @ (posedge CLK)
            begin
                if(tcounts==3'b111)
                    tcounts = 3'b000;
                else
                    tcounts = tcounts + 3'b001;
            end
            
endmodule

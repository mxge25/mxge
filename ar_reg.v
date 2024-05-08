`timescale 1ns / 1ps


module ar_reg(

    input arLD,CLK,arINR,arCLR,
    input [15:0] inAR,
    output reg [11:0] AR
    );
    
   wire[11:0]inr16,sum;
   wire cout;
   
   assign inr16=arINR?12'b000000000001:12'b0;
   assign {cout,sum}= inr16+AR;
   
   initial AR = 12'b0;
   always @(posedge CLK or posedge arCLR)
           begin
               if(arCLR)
                   begin
                       AR<=12'b0;
                   end
                   
               else if(arLD)
                   begin
                       AR<=inAR;
                   end    
                       
               else if(arINR)
                   begin
                       AR<=sum;
                   end                                          
               end    
    
endmodule

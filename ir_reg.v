`timescale 1ns / 1ps

module ir_reg(

    input irLD,CLK,irINR,irCLR,
    input [15:0] inIR,
    output [15:0] IR
    );
    
   wire[15:0]inr16,sum;
   wire cout;
   
   reg[15:0] out;
   
   assign inr16=irINR?16'b0000000000000001:16'b0;
   assign {cout,sum}= inr16+out;
   
   always @(posedge CLK)
           begin
               if(irCLR)
                   begin
                       out<=16'b0;
                   end
                   
               else if(irLD)
                   begin
                       out<=inIR;
                   end    
                       
               else if(irINR)
                   begin
                       out<=sum;
                   end                                          
               end    
       assign IR =out ;


endmodule

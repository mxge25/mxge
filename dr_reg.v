`timescale 1ns / 1ps

module dr_reg(
    input drLD,CLK,drINR,drCLR,
    input [15:0] inDR,
    output [15:0] DR
    );
    
   wire[15:0]inr16,sum;
   wire cout;
   
   reg[15:0] out;
   
   assign inr16=drINR?16'b0000000000000001:16'b0;
   assign {cout,sum}= inr16+out;
   
   always @(posedge CLK)
           begin
               if(drCLR)
                   begin
                       out<=16'b0;
                   end
                   
               else if(drLD)
                   begin
                       out<=inDR;
                   end    
                       
               else if(drINR)
                   begin
                       out<=sum;
                   end                                          
               end    
       assign DR =out ;

endmodule

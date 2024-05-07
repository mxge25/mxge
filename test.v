`timescale 1ns / 1ps

module test(
    input LD,CLK,INR,CLR,
    input [15:0] inDR,
    output [15:0] DR
       );
       wire[15:0]inr16,sum;
       wire cout;
       
       reg[15:0] out;
       
       assign inr16=INR?16'b0000000000000001:16'b0;
       assign {cout,sum}= inr16+out;
       
       
       always @(posedge CLK or posedge CLR)
               begin
                   if(CLR)
                       begin
                           out<=16'b0;
                       end
                       
                   else if(LD)
                       begin
                           out<=inDR;
                       end    
                           
                   else if(INR)
                       begin
                           out<=sum;
                       end                                          
                   end    
           assign DR =out ;

endmodule

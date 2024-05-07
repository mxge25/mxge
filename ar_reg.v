`timescale 1ns / 1ps


module ar_reg(

    input arLD,CLK,arINR,arCLR,
    input [15:0] inAR,
    output [11:0] AR
    );
    
   wire[11:0]inr16,sum;
   wire cout;
   
   reg[11:0] out;
   
   assign inr16=arINR?12'b000000000001:12'b0;
   assign {cout,sum}= inr16+out;
   
   always @(posedge CLK)
           begin
               if(arCLR)
                   begin
                       out<=12'b0;
                   end
                   
               else if(arLD)
                   begin
                       out<=inAR;
                   end    
                       
               else if(arINR)
                   begin
                       out<=sum;
                   end                                          
               end    
       assign AR =out ;
    
endmodule

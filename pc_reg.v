`timescale 1ns / 1ps

module pc_reg(
    input pcLD,CLK,pcINR,pcCLR,
          ISZ,SPA,SNA,SZA,SZE,
    
    input [15:0] inPC,
    input [15:0] AC,
    input [15:0] DR,
    input E,
    output [11:0] PC
    );
    
   wire[11:0]inr16,sum;
   wire cout;
   
   reg[11:0] out;
   
   assign inr16=pcINR?12'b000000000001:12'b0;
   assign {cout,sum}= inr16+out;
   
   always @(posedge CLK)
           begin
               if(pcCLR)
                   begin
                       out<=12'b0;
                   end
                   
               else if(pcLD)
                   begin
                       out<=inPC;
                   end    
                       
               else if(pcINR)
                   begin
                       out<=sum;
                   end
                   
               else if(ISZ&DR==15'b0)
                   begin
                        out<=sum;
                   end  
                   
               else if(SPA&AC[15]==0)
                   begin
                         out<=sum;
                   end
                   
               else if(SNA&AC[15]==1)
                   begin
                         out<=sum;
                   end  
               else if(SZA&AC==15'b0)
                   begin
                         out<=sum;
                   end
               else if(SZE&E==0)
                   begin
                         out<=sum;
                   end
                                                                              
               end    
       assign PC =out ;
    
endmodule

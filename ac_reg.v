`timescale 1ns / 1ps

module ac_reg(
    input acLD,CLK,acINR,acCLR,
          AND,ADD,CMA,CME,CIR,
          CIL,CLE,
          
    input [15:0] inAC,
    input [15:0] DR,
    output [15:0] AC,
    output E
    );
    
   wire[15:0]inr16,sum;
   wire cout;
   
   
   reg[15:0] out;
   reg flag;
   
   
   assign inr16=acINR?16'b0000000000000001:16'b0;
   assign {cout,sum}= inr16+out;
   
   
   always @(posedge CLK)
           begin
               if(acCLR)
                   begin
                       out<=16'b0;
                   end
                   
               else if(acLD)
                   begin
                       out<=inAC;
                   end    
                       
               else if(acINR)
                   begin
                       out<=sum;
                       flag<=cout;
                   end 
                   
               else if(AND)
                    begin
                       out<=out&DR;
                   end  
                    
               else if(ADD)
                    begin
                       {flag,out}<=out+DR;
                    end 
                    
               else if(CLE)
                    begin
                        flag<=0;
                    end
                    
                else if (CMA)
                     begin 
                        out<=~out;
                     end
                     
                else if (CME)
                     begin 
                        flag<=~flag;
                     end
                     
                else if (CIR)
                     begin 
                        flag<=flag;
                     end 
                     
                else if (CIL)
                     begin 
                         flag<=flag;
                     end
                     
               end    
       assign AC =out ;
       assign E =flag ;


endmodule

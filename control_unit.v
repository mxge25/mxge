`timescale 1ns / 1ps

module control_unit(
    input I,
    input [7:0] T,D,
    input [11:0] B,
    
    output irLD,irINR,irCLR,
           acLD,acINR,acCLR,
           pcLD,pcINR,pcCLR,
           arLD,arINR,arCLR,
           drLD,drINR,drCLR,

           AND,ADD,ISZ,CMA,
           CME,CIR,CIL,SPA,
           SNA,SZA,SZE,HLT,
           CLE,
           
           arSrc,drSrc,acSrc,
           pcSrc,irSrc,
           memSrc,memDes
    );
    
    //
    wire In = ~I;
    wire D7n = ~D[7];
    wire r ;
    assign r = D[7]&In&T[3];
    //ir
    assign irLD = T[1];
    assign irINR=0;
    assign irCLR=0;
    //ac
    assign acLD= D[0]&T[5]|D[1]&T[5]|D[2]&T[5];
    assign acINR=r&B[5];
    assign acCLR=r&B[11];
    //pc
    assign pcLD= D[4]&T[4]|D[5]&T[5];
    assign pcINR= T[1];  //complete this 
    assign pcCLR= 0;
    //ar
    assign arLD=T[0]|T[2]|I&T[3]&D7n;
    assign arINR=D[5]&T[4] ;
    assign arCLR=0 ;
    //dr
    assign drLD=T[4]&(D[0]|D[1]|D[2]|D[6]);
    assign drINR=D[6]&T[5];
    assign drCLR=0;

    // operations
    assign AND =D[0]&T[5];
    assign ADD =D[1]&T[5];
    assign ISZ =D[6]&T[6];
    assign CLE =r&B[10];
    assign CMA =r&B[9];
    assign CME =r&B[8];
    assign CIR =r&B[7];
    assign CIL =r&B[6];
    assign SPA =r&B[4];
    assign SNA =r&B[3];
    assign SZA =r&B[2];
    assign SZE =r&B[1];
    assign HLT =r&B[0];

    //sources
    assign irSrc =T[2];
    assign acSrc =D[3]&T[4];
    assign pcSrc =T[0]|D[5]&T[4];
    assign arSrc =D[4]&T[4]|D[5]&T[5];
    assign drSrc =D[2]&T[5]|D[6]&T[6];
    
    //mem
    assign memDes=D[3]&T[4]|D[6]&T[6];
    assign memSrc=T[1]|D7n&I&T[3]|D[0]&T[4]|D[1]&T[4]|D[2]&T[4]|D[6]&T[4];
    
    
    
    
endmodule

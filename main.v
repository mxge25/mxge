`timescale 1ns / 1ps

module main(
     output wire [15:0] DR, AC, IR,memData,
     output wire [11:0] PC, AR,
     output wire [7:0] T ,D,
     output wire [2:0] tcounts,
     output wire I,
     output wire E
    );
    
    wire [15:0] CB ;
    wire   irLD,irINR,irCLR,
	       acLD,acINR,acCLR,
	       pcLD,pcINR,pcCLR,
	       arLD,arINR,arCLR,
	       drLD,drINR,drCLR,
	       AND,ADD,ISZ,CMA,CME,CIR,CIL,SPA,SNA,SZA,SZE,HLT,CLE,arSrc,drSrc,acSrc,pcSrc,irSrc,memSrc,memDes;
    
    decoder decoder (IR[12:14],D);
    counter counter (CLK,tcounts);
    times times (tcounts,T);
    control_unit control_unit(I,T,D,IR[0:11],irLD,irINR,irCLR,acLD,acINR,acCLR,pcLD,pcINR,pcCLR,arLD,arINR,arCLR,drLD,drINR,drCLR,
                    AND,ADD,ISZ,CMA,CME,CIR,CIL,SPA,SNA,SZA,SZE,HLT,CLE,arSrc,drSrc,acSrc,pcSrc,irSrc,memSrc,memDes);
    RAM RAM (CLK, memSrc, AR, memDes, CB, memData );
    ir_reg ir_reg (irLD,CLK,irINR,irCLR,CB,IR);
    dr_reg dr_reg (drLD,CLK,drINR,drCLR,CB,DR);
    ar_reg ar_reg (arLD,CLK,arINR,arCLR,CB,AR);
    ac_reg ac_reg (acLD,CLK,acINR,acCLR,AND,ADD,CMA,CME,CIR,CIL,CLE,CB,DR,AC,E);
    pc_reg pc_reg (pcLD,CLK,pcINR,pcCLR,ISZ,SPA,SNA,SZA,SZE,CB,AC,DR,E,PC);

	assign CB=arSrc?{4'b0000,AR}:drSrc?DR:acSrc?AC:pcSrc?{4'b0000,PC}:irSrc?IR:memSrc?memData:15'b0;
    
endmodule

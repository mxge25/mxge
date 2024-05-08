`timescale 1ns / 1ps

module RAM (
    input CLK, memSrc,
    input [11:0] AR,
    input memDes,
    input [15:0] CB,
    output reg [15:0] memData
);

    reg [15:0] RAM_4K [4096:0];

    // Initial memory data (example data)
    initial begin
         $readmemh("E:\Instructions.txt", RAM_4K);
    end

    initial memData = 16'b0;

    // Memory read/write logic
    always  @(posedge CLK) begin
        if (memDes)
            RAM_4K[AR] <= CB;
        else if (memSrc)
            memData = RAM_4K[AR];
    end

endmodule

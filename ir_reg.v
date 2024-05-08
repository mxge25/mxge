`timescale 1ns / 1ps

module ir_reg (
    input irLD, CLK, irINR, irCLR,
    input [15:0] inIR,
    output reg [15:0] IR
);

    // Internal signals
    wire [15:0] inr16, sum;
    wire cout;

    // Combinational logic for incrementing
    assign inr16 = irINR ? 16'b0000000000000001 : 16'b0;
    assign {cout, sum} = inr16 + IR;
    
    initial IR = 16'b0;

    // Sequential logic for register behavior
    always @(posedge CLK) begin
        if (irCLR) begin
            IR <= 16'b0; // Clear the register
        end else begin
            if (irLD) begin
                IR <= inIR; // Load input value
            end else begin
                if (irINR) begin
                    IR <= sum; // Increment register
                end
            end
        end
    end

endmodule

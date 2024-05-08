`timescale 1ns / 1ps

module pc_reg (
    input pcLD, CLK, pcINR, pcCLR,
          ISZ, SPA, SNA, SZA, SZE,
    input [15:0] inPC,
    input [15:0] AC,
    input [15:0] DR,
    input E,
    output reg [11:0] PC
);

    // Internal signals
    wire [11:0] inr16, sum;
    wire cout;

    // Register for holding the program counter value

    // Combinational logic for incrementing
    assign inr16 = 12'b000000000001 ;
    assign {cout, sum} = inr16 + PC;


    initial PC = 12'b0;
    // Sequential logic for program counter behavior
    always @(posedge CLK) begin
        if (pcCLR) begin
            PC <= 12'b0; // Clear the program counter
        end else begin
            if (pcLD) begin
                PC <= inPC; // Load input value to the program counter
            end else begin
                if (pcINR) begin
                    PC <= sum; // Increment program counter value
                end else begin
                    if (ISZ && (DR == 16'h0000)) begin
                        PC <= sum; // Increment program counter if ISZ and DR is zero
                    end else begin
                        if (SPA && (AC[15] == 0)) begin
                            PC <= sum; // Increment program counter if SPA and AC[15] is zero
                        end else begin
                            if (SNA && (AC[15] == 1)) begin
                                PC <= sum; // Increment program counter if SNA and AC[15] is one
                            end else begin
                                if (SZA && (AC == 16'h0000)) begin
                                    PC <= sum; // Increment program counter if SZA and AC is zero
                                end else begin
                                    if (SZE && (E == 0)) begin
                                        PC <= sum; // Increment program counter if SZE and E is zero
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    // Output assignment

endmodule

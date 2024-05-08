`timescale 1ns / 1ps

module ac_reg (
    input acLD, CLK, acINR, acCLR,
          AND, ADD, CMA, CME, CIR,
          CIL, CLE,
    input [15:0] inAC,
    input [15:0] DR,
    output reg [15:0] AC,
    output reg E
);

    // Internal signals
    wire [15:0] inr16, sum;
    wire cout;

    // Register for holding the accumulator value
    // Flag indicating the status of the accumulator

    // Combinational logic for incrementing
    assign inr16 = acINR ? 16'b0000000000000001 : 16'b0;
    assign {cout, sum} = inr16 + AC;


    initial begin
        AC = 12'b0;
        E=0;
     end
    // Sequential logic for accumulator behavior
    always @(posedge CLK) begin
        if (acCLR) begin
            AC <= 16'b0; // Clear the accumulator
        end else begin
            if (acLD) begin
                AC <= inAC; // Load input value to the accumulator
            end else begin
                if (acINR) begin
                    AC <= sum; // Increment accumulator value
                    E <= cout; // Update flag
                end else begin
                    if (AND) begin
                        AC <= AC & DR; // Perform bitwise AND operation with DR
                    end else begin
                        if (ADD) begin
                            {E, AC} <= AC + DR; // Perform addition with DR and update flag
                        end else begin
                            if (CLE) begin
                                E <= 1'b0; // Clear flag
                            end else begin
                                if (CMA) begin
                                    AC <= ~AC; // Perform bitwise complement operation on accumulator value
                                end else begin
                                    if (CME) begin
                                        E <= ~E; // Perform bitwise complement operation on flag
                                    end else begin
                                        if (CIR || CIL) begin
                                            // CIR and CIL operations have no effect on the accumulator or flag
                                            E <= E; // Maintain flag state
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    // Output assignments

endmodule

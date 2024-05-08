module times (
    input [2:0] tcounts,
    output reg [7:0] T
);

    always @(*)
    casez (tcounts)
        3'b000: T = 8'b00000001;
        3'b001: T = 8'b00000010;
        3'b010: T = 8'b00000100;
        3'b011: T = 8'b00001000;
        3'b100: T = 8'b00010000;
        3'b101: T = 8'b00100000;
        3'b110: T = 8'b01000000;
        3'b111: T = 8'b10000000;
        default: T = 8'b00000000; // Optional: Handle default case
    endcase

endmodule

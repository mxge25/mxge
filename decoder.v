module decoder (
    input [2:0] decoderIn,
    output reg [7:0] D
);

    initial D = 8'b0;
    always @(*)
    casez (decoderIn)
        3'b000: D = 8'b00000001;
        3'b001: D = 8'b00000010;
        3'b010: D = 8'b00000100;
        3'b011: D = 8'b00001000;
        3'b100: D = 8'b00010000;
        3'b101: D = 8'b00100000;
        3'b110: D = 8'b01000000;
        3'b111: D = 8'b10000000;
        default: D = 8'b00000000; // Optional: Handle default case
    endcase

endmodule

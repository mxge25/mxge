module counter (
    input CLK,
    output reg [2:0] tcounts
);

    // Initialize tcounts to 000
    initial tcounts = 3'b000;

    always @(posedge CLK) begin
        if (tcounts == 3'b111) begin
            tcounts <= 3'b000;
        end else begin
            tcounts <= tcounts + 3'b001; // Increment tcounts
        end
    end

endmodule

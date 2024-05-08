module dr_reg(
    input drLD, CLK, drINR, drCLR,
    input [15:0] inDR,
    output reg [15:0] DR
);

wire [15:0] inr16, sum;
wire cout;

assign inr16 = drINR ? 16'b0000000000000001 : 16'b0;
assign {cout, sum} = inr16 + DR;


initial DR = 16'b0;

always @(posedge CLK or posedge drCLR) begin
    if (drCLR) begin
        DR <= 16'b0;
    end else begin
        if (drLD) begin
            DR <= inDR;
        end else begin
            if (drINR) begin
                DR <= sum;
            end
        end
    end
end

endmodule

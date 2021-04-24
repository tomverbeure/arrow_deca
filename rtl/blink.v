`default_nettype none

module blink(
    input wire      clk,
    input wire      button,
    output wire     led0,
    output wire     led1,
    output wire     led2
);

    reg [25:0] cntr = 0;

    always @(posedge clk) begin
        cntr    <= cntr + (button ? 1 : 2);
    end

    assign led0     = cntr[25];
    assign led1     = cntr[24];
    assign led2     = cntr[23];

endmodule

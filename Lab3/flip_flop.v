`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 06:00:55 PM
// Design Name: 
// Module Name: flip_flop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flip_flop(
    input clk,
    input reset,
    input D,
    output reg Q,
    output wire QN
);

initial Q = 1'b0;

assign QN = ~Q;

always @(posedge clk or negedge reset) begin
    if (!reset)
        Q <= 1'b0;
    else
        Q <= D;
end


endmodule

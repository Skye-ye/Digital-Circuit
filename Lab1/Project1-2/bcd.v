`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 12:37:10 AM
// Design Name: 
// Module Name: bcd
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


module bcd(
    input RSTN,
    input CLK,
    input [3:0] SW,
    output reg [15:14] LED
);

wire greater_than_4;
wire less_than_8;

assign greater_than_4 = SW[3] | (SW[2] & (SW[1] | SW[0]));
assign less_than_8 = ~SW[3];

always @(posedge CLK or negedge RSTN) begin
    if (!RSTN) begin
        LED[15] = 0;
        LED[14] = 0;
    end else begin
        LED[15] = greater_than_4;
        LED[14] = less_than_8;
    end
end

endmodule


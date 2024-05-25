`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 06:07:48 PM
// Design Name: 101 sequence detecter
// Module Name: detecter
// Project Name: 
// Target Devices: Nexy A7-100T
// Tool Versions: 
// Description: 
// repeatable detection of '101' sequence
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module detecter(
    input [0:0] SW,
    input BTNC,
    input CPU_RESETN,
    output reg [0:0] LED
    );

    wire Q0, Q1;

    initial LED = 1'b0;

    flip_flop D0(
        .clk(BTNC),
        .reset(CPU_RESETN),
        .D(~SW[0]),
        .Q(Q0),
        .QN()
    );

    flip_flop D1(
        .clk(BTNC),
        .reset(CPU_RESETN),
        .D(Q0 & ~SW[0]),
        .Q(Q1),
        .QN()
    );

    always @(posedge BTNC or negedge CPU_RESETN) begin
        if (!CPU_RESETN)
            LED <= 1'b0;  
        else
            LED[0] <= Q1 & Q0 & SW[0]; 
    end
endmodule

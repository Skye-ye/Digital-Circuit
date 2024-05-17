`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 10:05:24 PM
// Design Name: 
// Module Name: judge
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


`timescale 1ns / 1ps

module judge(
    input CLK,
    input RSTN,
    input [2:0] SW,
    output reg [15:15]LED
    );

    wire n1, n2;
    wire comb_LED; 

    nand nd1(n1, SW[0], SW[1]),
         nd2(n2, SW[0], SW[2]),
         nd3(comb_LED, n1, n2);

    always @(posedge CLK or negedge RSTN) begin
        if (!RSTN) begin
            LED[15] <= 0;
        end else begin
            LED[15] <= comb_LED;
        end
    end
endmodule



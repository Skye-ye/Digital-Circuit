`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 11:30:47 PM
// Design Name: 
// Module Name: BCD_to_7Segment
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


module BCD_to_7Segment(
    input [3:0] bcd,
    output reg [7:0] seg 
);
    always @(*) begin
        case (bcd)
            4'h0: seg[6:0] = 7'b1000000; 
            4'h1: seg[6:0] = 7'b1111001; 
            4'h2: seg[6:0] = 7'b0100100; 
            4'h3: seg[6:0] = 7'b0110000; 
            4'h4: seg[6:0] = 7'b0011001; 
            4'h5: seg[6:0] = 7'b0010010; 
            4'h6: seg[6:0] = 7'b0000010; 
            4'h7: seg[6:0] = 7'b1111000; 
            4'h8: seg[6:0] = 7'b0000000; 
            4'h9: seg[6:0] = 7'b0010000; 
            default: seg[6:0] = 7'b1111111; 
        endcase
        seg[7] = 1; 
    end
endmodule

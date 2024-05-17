`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 10:28:14 PM
// Design Name: 
// Module Name: display_controller
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


module display_controller(
    input CLK100MHZ,
    input CPU_RESETN,
    input [3:0] SW,
    output reg [7:0] AN,
    output [7:0] SEG
);
    reg [3:0] digit;
    reg [2:0] counter = 3'b000;
    wire clk_1kHz;

    initial AN = 8'b01111111;

    clock_divider #( .COUNT(50000) ) cd(
        .clk_in(CLK100MHZ),
        .reset(~CPU_RESETN),  
        .clk_out(clk_1kHz)
    );

    BCD_to_7Segment decoder(
        .bcd(digit),
        .seg(SEG)
    );

    always @(posedge clk_1kHz or negedge CPU_RESETN) begin
        if (!CPU_RESETN) begin
            digit <= 4'b0000; 
            counter <= 3'b000;
            AN <= 8'b11111111;
        end else begin
            digit <= SW[3:0]; 
            if (counter == 3'b111) begin
                counter <= 3'b000;
                AN <= 8'b01111111; 
            end else begin
                AN <= {AN[0], AN[7:1]}; 
                counter <= counter + 1;
            end
        end
    end

endmodule

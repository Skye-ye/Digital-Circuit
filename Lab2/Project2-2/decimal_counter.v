`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 11:32:03 PM
// Design Name: 
// Module Name: decimal_counter
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


module decimal_counter(
    input CLK100MHZ,
    input CPU_RESETN,
    input [7:0] SW,
    output reg [7:0] AN,
    output [7:0] SEG
);
    reg [3:0] digit = 4'b0000;
    reg [2:0] counter = 3'b000;
    wire clk_1kHz;
    wire clk_1hz;

    clock_divider #( .COUNT(50000) ) cd_1khz(
        .clk_in(CLK100MHZ),
        .reset(~CPU_RESETN),  
        .clk_out(clk_1kHz)
    );

    clock_divider #( .COUNT(50000000) ) cd_1hz(
        .clk_in(CLK100MHZ),
        .reset(~CPU_RESETN),
        .clk_out(clk_1hz)
    );

    BCD_to_7Segment decoder(
        .bcd(digit),
        .seg(SEG)
    );

    always @(posedge clk_1hz or negedge CPU_RESETN) begin
        if (!CPU_RESETN) begin
            digit <= 4'b0000;
        end else if (SW[0]) begin
            if (digit == 4'b1001) begin
                digit <= 4'b0000;
            end else begin
                digit <= digit + 1;
            end
        end
    end

    always @(posedge clk_1kHz or negedge CPU_RESETN) begin
        if (!CPU_RESETN) begin
            counter <= 3'b000;
            AN <= 8'b11111111;
        end else begin
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

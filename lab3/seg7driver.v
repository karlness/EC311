`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 06:03:17 PM
// Design Name: 
// Module Name: seg7driver
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


module seg7driver(
    input clk,
    input rst,
    input [6:0] sseg0,
    input [6:0] sseg1,
    input [6:0] sseg2,
    input [6:0] sseg3,
    output reg [7:0] AN,
    output reg [6:0] segment
    );
    
    reg [19:0] refresh;
    wire [1:0] activate;


    always @ (posedge clk or posedge rst) begin
    if (rst==1)
    refresh <=0;
    else
    refresh <= refresh + 1;
    end

    assign activate = refresh[19:18];

    always @ (*)
    begin
        case (activate)
        2'b00: begin
               AN = 8'b11111110;
               segment = sseg0;
               end
        2'b01: begin
               AN = 8'b11111101;
               segment = sseg1;
               end
        2'b10: begin
               AN = 8'b11111011;
               segment = sseg2;
               end
        2'b11: begin
               AN = 8'b11110111;
               segment = sseg3;
               end
        default: begin
               AN = 8'b11111110;
               segment = sseg0;
               end
        endcase
     end


endmodule

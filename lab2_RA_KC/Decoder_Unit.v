`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 04:55:08 PM
// Design Name: 
// Module Name: Decoder_Unit
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


module Decoder_Unit(
    input [3:0] result_2s,
    output [6:0] CA_hex
    );
    
    reg [6:0] CA_hex;
    
    always @ (result_2s)
    begin
    case (result_2s)
    4'b0000: CA_hex = 7'b0000001;
    4'b0001: CA_hex = 7'b1001111;
    4'b0010: CA_hex = 7'b0010010;
    4'b0011: CA_hex = 7'b0000110;
    4'b0100: CA_hex = 7'b1001100;
    4'b0101: CA_hex = 7'b0100100;
    4'b0110: CA_hex = 7'b0100000;
    4'b0111: CA_hex = 7'b0001111;
    4'b1000: CA_hex = 7'b0000000;
    4'b1001: CA_hex = 7'b0001100;
    4'b1010: CA_hex = 7'b0001000;
    4'b1011: CA_hex = 7'b1100000;
    4'b1100: CA_hex = 7'b0110001;
    4'b1101: CA_hex = 7'b1000010;
    4'b1110: CA_hex = 7'b0110000;
    4'b1111: CA_hex = 7'b0111000;
    endcase
    end
    
endmodule

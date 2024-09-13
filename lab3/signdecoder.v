`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 03:41:07 PM
// Design Name: 
// Module Name: signdecoder
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


module signdecoder(
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,
    output reg [6:0] sseg

    );
    
    reg sign; 
        
    always @ (op) begin
    sseg = 7'b1111111;
    sign = op[2] ^ op[1];
    
    if (sign == 1) begin
        case (op)
        3'b010: if (a<b) begin
                sseg = 7'b1111110;
                end
        3'b011: if (a>b) begin
                sseg = 7'b1111110;
                end
        3'b100: sseg = 7'b1111110;
        3'b101: sseg = 7'b1111110;
        default:  sseg = 7'b1111111;
        endcase
    end
    end
    
endmodule

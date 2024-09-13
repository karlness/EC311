`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 05:24:47 PM
// Design Name: 
// Module Name: Modified_decoder
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


module Modified_decoder(
    input [3:0] bcd,
    output [6:0] sseg
    );
    
    reg [6:0] sseg;
    
    always @ (*)
    begin
    
    case (bcd)
    0: sseg = 7'b0000001;
    1: sseg = 7'b1001111;
    2: sseg = 7'b0010010;
    3: sseg = 7'b0000110;
    4: sseg = 7'b1001100;
    5: sseg = 7'b0100100;
    6: sseg = 7'b0100000;
    7: sseg = 7'b0001111;
    8: sseg = 7'b0000000;
    9: sseg = 7'b0001100;
    default : sseg = 7'b0000000;
    endcase
    end
    
    
endmodule

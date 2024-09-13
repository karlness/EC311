`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 04:38:11 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input c_in,
    input [3:0] a,
    input [3:0] b,
    input mode,
    output reg [4:0] diff,
    output  c_out
    );
    
    wire B0, B1, B2, B3;
        
    wire c1, c2, c3, c4;
    
    wire [4:0] result;
    
    xor(B0, b[0], mode);
    xor(B1, b[1], mode);
    xor(B2, b[2], mode);
    xor(B3, b[3], mode);
    xor(result[4], c4, mode);

    
    full_adder add1(mode, a[0], B0, result[0], c1);
    full_adder add2(c1, a[1], B1, result[1], c2);
    full_adder add3(c2, a[2], B2, result[2], c3);
    full_adder add4(c3, a[3], B3, result[3], c4);
    
    
    always @ (result) begin
        if (b>a) begin
        diff = ~(result-1);
        end
    end
    
endmodule

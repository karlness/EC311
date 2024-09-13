`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 04:44:38 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input c_in,
    input a,
    input b,
    output sum,
    output c_out
    );
    
    wire w1, w2, w3;
    half_adderr adder(a, b, w1, w2);
    half_adderr addera(c_in, w1, sum, w3);
    
    or orgate(c_out, w3, w2);
    
endmodule

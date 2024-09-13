`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 05:21:09 PM
// Design Name: 
// Module Name: ripplecarry_adder
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

  module ripplecarry_adder(
    input c_in,
    input  [2:0] a,
    input  [2:0] b,
    output [2:0] sum,
    output c_out

    );
    
    wire [2:0] w1, w2, w3;
    
    full_adder adder1 (a[0], b[0], c_in, sum[0], w1[0]);
    full_adder adder2(a[1], b[1], w1[0], sum[1], w1[1]);
    full_adder adder3(a[2], b[2], w1[1], sum[2], c_out);
 
 
    
endmodule




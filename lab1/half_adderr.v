`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 04:14:12 PM
// Design Name: 
// Module Name: half_adderr
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


module half_adderr(
    input a,
    input b,
    output sum,
    output c_out
    );
    
   and and_gate(c_out, a, b);
   xor xor_gate(sum, a, b);
    
    
    
endmodule

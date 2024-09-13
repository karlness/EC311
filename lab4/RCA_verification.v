`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 04:40:30 PM
// Design Name: 
// Module Name: RCA_verification
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


module RCA_verification # (parameter n = 1) (
    a, 
    b, 
    sum
    );
    
    input [n-1: 0] a, b;
    output [n: 0] sum;
    
    assign sum = a + b;
    
endmodule

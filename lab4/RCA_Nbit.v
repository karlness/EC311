`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 04:20:18 PM
// Design Name: 
// Module Name: RCA_Nbit
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


module RCA_Nbit # (parameter n = 1) (
    c_in,
    a,
    b,
    sum
    );
    
    input c_in;
    input [n-1: 0] a, b;
    output [n: 0] sum;
    
    wire [n: 0] c;
    assign c[0] = c_in;
    
    genvar i;
    generate
        for (i=0; i<n; i = i+1)
        begin
            full_adder add1(c[i], a[i], b[i], sum[i], c[i+1]);
        end
    endgenerate
    
    assign sum[n] = c[n];
    
endmodule

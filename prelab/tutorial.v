`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 03:52:31 PM
// Design Name: 
// Module Name: tutorial
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


module tutorial(
    input A,
    input B,
    input C,
    output D,
    output E
    );
    
    wire w1;
    
    and G1(w1, A, B);
    not G2(E, C);
    or  G3(D, w1, E);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:04:14 PM
// Design Name: 
// Module Name: tutorial_testbench
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


module tutorial_testbench(

    );
    reg A, B, C; //inputs
    wire D, E; //outputs
    
    tutorial tut1(.A(A), .B(B), .C(C), .D(D), .E(E));
    
    initial
    begin
      A = 0;
      B = 0;
      C = 0;
      
      #100 A=1; B=1; C=1;
      #100 $finish;
   end
    
endmodule

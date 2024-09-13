`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 05:12:55 PM
// Design Name: 
// Module Name: fulladder_testbench
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


module fulladder_testbench(

    );
    
    reg a, b, c_in, w3, w2;
    wire w1, w2, sum, w3, c_out;
    
    half_adderr(a, b, w1, w2);
    half_adderr(c_in, w1, sum, w3);
    or orgate(c_out, w3, w2);
    
    initial
    begin
    a = 0;
    b = 0;
    
    #10 a=1;
    #10 b=1;
    #10 a=0;
    #10 $finish;
    
    end    
endmodule


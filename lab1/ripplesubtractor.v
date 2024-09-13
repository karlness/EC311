`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 05:32:05 PM
// Design Name: 
// Module Name: ripplesubtractor
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


module ripplesubtractor(
     input c_in,
     input [2:0]a,
     input [2:0]b,
     input [1:0] mode,
     output [2:0] sum,
     output c_out 
    );
    
    wire [2:0] Breg;
    assign Breg = mode[0] ? b: ~b+1 ;
    ripplecarry_adder ripple(.c_in(c_in), .a(a), .b(Breg), .sum(sum), .c_out(c_out));
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 04:55:17 PM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
    input c_in,
    input [3:0] a,
    input [3:0] b,
    input mode,
    output [3:0] sum,
    output c_out
    );
    
    
    wire B0, B1, B2, B3;
    
    xor(B0, b[0], mode);
    xor(B1, b[1], mode);
    xor(B2, b[2], mode);
    xor(B3, b[3], mode);
    
    wire [3:0] t0, t1, c0, c1;
    
    full_adder add00(1'b0, a[0], B0, t0[0], c0[0]);
    full_adder add01(c0[0], a[1], B1, t0[1], c0[1]);
    full_adder add02(c0[1], a[2], B2, t0[2], c0[2]);
    full_adder add03(c0[2], a[3], B3, t0[3], c0[3]);
    
    full_adder add10(1'b1, a[0], B0, t1[0], c1[0]);
    full_adder add11(c1[0], a[1], B1, t1[1], c1[1]);
    full_adder add12(c1[1], a[2], B2, t1[2], c1[2]);
    full_adder add13(c1[2], a[3], B3, t1[3], c1[3]);
    
    multiplexer1 carry(c0[3], c1[3], mode, c_out);
    multiplexer1 adder0(t0[0], t1[0], mode, sum[0]);
    multiplexer1 adder1(t0[1], t1[1], mode, sum[1]);
    multiplexer1 adder2(t0[2], t1[2], mode, sum[2]);
    multiplexer1 adder3(t0[3], t1[3], mode, sum[3]);
    
endmodule

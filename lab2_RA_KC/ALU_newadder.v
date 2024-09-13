`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 05:13:26 PM
// Design Name: 
// Module Name: ALU_newadder
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


module ALU_newadder(
    input [3:0] a,
    input [3:0] b,
    input [2:0] Op,
    input Mode,
    input c_in,
    output c_out,
    output [6:0] CA,
    output [7:0] AN
    );
    
    
    wire [3:0] one;
    assign one = 4'b0001;
    wire [3:0] na;
    assign na = ~a;
    wire [3:0] nb;
    assign nb = nb;
    
    wire [3:0] result0;
    wire cout0;
    carry_select_adder addna1(c_in, na, one, Op[2], result0, cout0);
    
    wire [3:0] result1;
    wire cout1;
    carry_select_adder addnb1(c_in, nb, one, Op[2], result1, cout1);
    
    wire [3:0] result2;
    wire cout2;
    carry_select_adder adder(c_in, a, b, Op[2], result2, cout2);
    
    wire [3:0] result3;
    wire cout3;
    carry_select_adder sub1(c_in, a, b, Op[1], result3, cout3);
    
    
    
    wire [3:0] result5;
    wire cout5;
    carry_select_adder sub2(c_in, b, a, Op[0], result5, cout5);
    
    wire [3:0] result6;
    wire cout6;
    carry_select_adder adda1(c_in, a, one, Op[0], result6, cout6);
    
    wire [3:0] result7;
    wire cout7;
    carry_select_adder suba1(c_in, a, one, Op[0], result7, cout7);
    
    
    
    reg c_out;
    reg [3:0] result;
    
    always @ * begin
    c_out=0;
    case (Mode)
    0: begin
        case (Op)
        3'b000: result = a & b;
        3'b001: result = a | b;
        3'b010: result = ~(a & b);
        3'b011: result = ~(a | b); 
        3'b100: result = a ^ b;
        3'b101: result = ~(a ^ b);
        3'b110: result = ~a;
        3'b111: result = ~b;
        endcase
        end
    1: begin
        case (Op)
        3'b000: {result, c_out} = {result0, cout0};
        3'b001: {result, c_out} = {result1, cout1};
        3'b010: {result, c_out} = {result2, cout2};
        3'b011: {result, c_out} = {result3, cout3}; 
        3'b100: result = a*b;
        3'b101: {result, c_out} = {result5, cout5};
        3'b110: {result, c_out} = {result6, cout6};
        3'b111: {result, c_out} = {result7, cout7};
        endcase
        end
    endcase
    end
    
    assign AN = 8'b01111111;
    
    Decoder_Unit disp(result, CA);
    
endmodule

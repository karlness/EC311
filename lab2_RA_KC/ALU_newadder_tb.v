`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 05:31:32 PM
// Design Name: 
// Module Name: ALU_newadder_tb
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


module ALU_newadder_tb(

    );
    
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] op;
    reg mode;
    reg c_in;
    wire c_out;
    wire [3:0] result;
    wire [6:0] CA;
    wire [7:0] AN;
    
    ALU_newadder test(a, b, op, mode, c_in, c_out, result, CA, AN);
    
    initial begin
    a = 4'b0000;
    b = 4'b0000;
    c_in = 0;
    op = 3'b010;
    mode = 1;
    end
    
    always begin
    #1 {mode, op, a, b} = {mode, op, a, b} + 1;
    end
    
endmodule

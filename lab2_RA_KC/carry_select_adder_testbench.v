`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 05:06:49 PM
// Design Name: 
// Module Name: carry_select_adder_testbench
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


module carry_select_adder_testbench(

    );
    reg [3:0] a;
    reg signed [3:0] b;
    reg c_in;
    reg mode;
    wire [3:0] sum;
    wire c_out;
    
    carry_select_adder csa(c_in, a, b, mode, sum, c_out);
    
    initial begin
    a = 4'b0000;
    b = 4'b0000;
    c_in = 1;
    mode = 1;
    end
    
    always begin
    #2 {c_in, a, b} = {c_in, a, b} + 1;
    end
    
endmodule

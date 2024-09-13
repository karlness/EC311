`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 04:21:47 PM
// Design Name: 
// Module Name: moore_FSM_tb
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


module moore_FSM_tb(

    );
    
    reg clock;
    reg rst;
    reg read; 
    reg [7:0] in;
    
    wire out;
    
    
    initial begin
    clock = 0;
    forever #5 clock = ~clock;
    end
    
    initial begin
    in = 8'b10010011;
    rst = 0;
    read = 1;
    end
    
    always begin
    #30 rst = 0;
    #30 rst = 1;
    end
    
    moore_FSM test(out, clock, rst, read, in);
    
endmodule

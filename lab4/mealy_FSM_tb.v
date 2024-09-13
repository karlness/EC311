`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 05:11:17 PM
// Design Name: 
// Module Name: mealy_FSM_tb
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


module mealy_FSM_tb(

    );
    
    reg clock;
    reg rst;
    reg in;
    
    wire out;
    
    
    initial begin
    clock = 0;
    forever #5 clock = ~clock;
    end
    
    initial begin
    rst = 0;
    end
    
    always begin
    #20 rst = 0;
    #100 rst = 1;
    end
    
    initial begin
    in = 0;
    forever #12 in = ~in;
    end
    
    mealy_FSM test(out, clock, rst, in);
    
endmodule

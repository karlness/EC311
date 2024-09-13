`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 04:51:49 PM
// Design Name: 
// Module Name: multiplexer1
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


module multiplexer1(
    input i0,
    input i1,
    input sel,
    output bitout
    );
    
    reg bitout;
    
    always @ (i0, i1, sel) 
    begin
    if (sel == 0)
        bitout = i0;
    else
        bitout = i1;
    end
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 04:42:43 PM
// Design Name: 
// Module Name: RCA_32bit_tb
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


module RCA_32bit_tb(

    );
    
    reg [31:0] a, b;
    reg c_in;
    wire [32:0] sum;
    
    wire [32:0] ver_sum;
    wire error_flag;
    
    RCA_Nbit #(32) rca(c_in, a, b, sum);
    
    RCA_verification #(32) verify(a, b, ver_sum);
    
    assign error_flag = (sum != ver_sum);
    
    always @ (sum) begin
    if (error_flag)
        $display("Error occurs when a = %d, and b = %d", a, b);
    end
    
    initial begin
    a = 0;
    b = 0;
    c_in = 0;
    end
    
    always begin
    #1 a = a + 1593;
    #1 b = b + 3961;
    end
    
    
endmodule

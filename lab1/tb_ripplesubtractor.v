`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 07:26:42 PM
// Design Name: 
// Module Name: tb_ripplesubtractor
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
module ripplesubtractor_testbench;

    
    reg c_in;
    reg [2:0] a, b;
    reg [1:0] mode;
    wire [2:0] sum;
    wire c_out;

  
    ripplesubtractor UUT (
        .c_in(c_in),
        .a(a),
        .b(b),
        .mode(mode),
        .sum(sum),
        .c_out(c_out)
    );

    
    initial begin
        $dumpfile("ripplesubtractor.vcd");
        $dumpvars(0,ripplesubtractor_testbench);

        
        a = 3'b011;  
        b = 3'b001;  
        c_in = 1'b0;
        mode = 2'b01;  
        #10;

       
        a = 3'b010;  
        b = 3'b011;  
        c_in = 1'b0;
        mode = 2'b01; 
        #10;

      
        a = 3'b010;  
        b = 3'b001;  
        c_in = 1'b0;
        mode = 2'b00; 
        #10;

       
        a = 3'b000;  
        b = 3'b001;  
        c_in = 1'b1;  
        mode = 2'b01;  
        #10;

       
        $finish;
        end

endmodule

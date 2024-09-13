`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 05:15:19 PM
// Design Name: 
// Module Name: ALU_modified_lab3
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


module ALU_modified_lab3(
    input CLK100MHZ,
    input reset,
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
    carry_select_adder add(c_in, b, a, Op[0], result0, cout0);
    
    
    wire [3:0] result2;
    wire cout2;
    subtractor subab(c_in, a, b, Op[1], result2, cout2);
    
    wire [3:0] result3;
    wire cout3;
    subtractor subba(c_in, b, a, Op[1], result3, cout3);
    
    
    wire [3:0] result6;
    wire cout6;
    carry_select_adder adda1(c_in, a, one, Op[0], result6, cout6);
    
    wire [3:0] result7;
    wire cout7;
    carry_select_adder suba1(c_in, a, one, Op[0], result7, cout7);
    
    
    
    reg c_out;
    reg [9:0] result;
    
    always @ * begin
    c_out=0;
    case (Mode)
    0: begin
        case (Op)
        3'b000: result[3:0] = a & b;
        3'b001: result[3:0] = a | b;
        3'b010: result[3:0] = ~(a & b);
        3'b011: result[3:0] = ~(a | b); 
        3'b100: result[3:0] = a ^ b;
        3'b101: result[3:0] = ~(a ^ b);
        3'b110: result[3:0] = ~a;
        3'b111: result[3:0] = ~b;
        endcase
        end
    1: begin
        case (Op)
        3'b000: {result[4:0], c_out} = {result0, cout0}; //a+b
        3'b001: result = a*b; //a*b
        3'b010: {result[4:0], c_out} = {result2, cout2}; //a-b
        3'b011: {result[4:0], c_out} = {result3, cout3}; //b-a
        3'b100: {result[3:0], c_out} = {a, 1'b0}; //-a
        3'b101: {result[3:0], c_out} = {b, 1'b0}; //-b
        //3'b110: {result[4:0], c_out} = {result6, cout6}; //tempc
        //3'b111: {result[4:0], c_out} = {result7, cout7}; //tempf
        endcase
        end        
    default: result = 9'b000000000;
    endcase
    end
    
    
    //driving the 7 segment display
    wire [11:0] digits;
    bin2bcd display(result, digits);
    
    
    wire [6:0] seg0, seg1, seg2, seg3;
    Modified_decoder ones(digits[3:0], seg0);
    Modified_decoder tens(digits[7:4], seg1);
    Modified_decoder thousands(digits[11:8], seg2);
    signdecoder sign(a, b, Op, seg3);
    
    
    reg [7:0] AN;
    reg [6:0] CA;
    reg [19:0] refresh;
    wire [1:0] activate;


    always @ (posedge CLK100MHZ or posedge reset) begin
    if (reset==0)
    refresh <=0;
    else
    refresh <= refresh + 1;
    end

    assign activate = refresh[19:18];

    always @ (*)
    begin
        case (activate)
        2'b00: begin
               AN = 8'b11111110;
               CA = seg0;
               end
        2'b01: begin
               AN = 8'b11111101;
               CA = seg1;
               end
        2'b10: begin
               AN = 8'b11111011;
               CA = seg2;
               end
        2'b11: begin
               AN = 8'b11110111;
               CA = seg3;
               end
        default: begin
               AN = 8'b11111110;
               CA = seg0;
               end
        endcase
     end
    
endmodule

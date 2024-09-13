`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 04:56:09 PM
// Design Name: 
// Module Name: mealy_FSM
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


module mealy_FSM(out, clk, reset, in);
    input clk, reset; 
    input in;
    output out;
    
    
    reg [1:0] present_state, next_state;
    reg out;
    
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
    
     always @(in or present_state) begin
        case (present_state)
            S0: begin out = 0;
                if (in==0) next_state = S2;
                else next_state = S1;
                end
            S1: begin out = 1;
                if (in==0) next_state = S2;
                else next_state = S1;
                end
            S2: begin out = 0;
                if (in==0) next_state = S2;
                else next_state = S1;
                end
            default: next_state = S0;
            endcase
     end
    
    
    always @ (posedge clk) begin
    if (reset) begin
    present_state <= S0;
    out = 0;
    end
    else
    present_state <= next_state;
    end
    
    
    
endmodule

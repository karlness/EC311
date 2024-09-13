`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 05:32:11 PM
// Design Name: 
// Module Name: StopwatchModule
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


module StopwatchModule(
    input clk,  // Clock input
    input [2:0] control,  // Control input: {stop, reset, start}
    output reg [31:0] count = 0  // 32-bit counter for the stopwatch time
);
   
   initial begin
     count = 0;
     end

    reg running = 0;  // A flag to determine if the stopwatch is running

    // Counter logic
    always @(posedge clk) begin
        if (control[1]) begin
            count <= 0;       // Reset the counter to 0
            running <= 0;     // Stop running when reset
        end
        else if (control[2]) begin
            running <= 0;     // Stop the stopwatch
        end
        else if (control[0]) begin
            running <= 1;     // Start the stopwatch
        end
       
        if (running) begin
            count <= count + 1;  // Increment the counter if running
        end
    end

endmodule
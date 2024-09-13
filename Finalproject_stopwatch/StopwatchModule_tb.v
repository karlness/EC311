`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 05:38:13 PM
// Design Name: 
// Module Name: StopwatchModule_tb
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
module StopwatchModuleTestbench;

    reg clk;
    reg [2:0] control;
    wire [31:0] count;

    StopwatchModule uut (
        .clk(clk),
        .control(control),
        .count(count)
    );

    // Generate a clock with a 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

 
    initial begin
        // Initialize control signals to a known state
        control = 3'b000;

        // reset at the start to put the stopwatch in a known state
        control[1] <= 1'b1;
        #20 control[1] <= 1'b0; // Return to default state

        // Start the stopwatch
        control[0] <= 1'b1; // Set start bit to high
        #100 control[0] <= 1'b0; // Clear start bit to simulate stopping

        // Stop the stopwatch
        control[2] <= 1'b1; // Set stop bit to high
        #20 control[2] <= 1'b0; // Clear stop bit

        // Reset the stopwatch
        control[1] <= 1'b1; // Set the reset bit to high
        #20 control[1] <= 1'b0; // Clear the reset bit

        // Start the stopwatch again
        control[0] <= 1'b1; // Set start bit to high
        #100 control[0] <= 1'b0; // Clear start bit

        // Stop the simulation
        #40 $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time = %0t, Control = %b, Count = %d", $time, control, count);
    end
    
endmodule
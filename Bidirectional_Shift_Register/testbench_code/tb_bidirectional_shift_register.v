`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2024 16:59:37
// Design Name: 
// Module Name: tb_bidirectional_shift_register
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


`timescale 1ns / 1ps

module tb_bidirectional_shift_register;

    // Inputs
    reg clk;
    reg rst;
    reg shift_left;
    reg shift_right;
    reg serial_in_left;
    reg serial_in_right;

    // Output
    wire [3:0] q;

    // Instantiate the bidirectional shift register
    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        shift_left = 0;
        shift_right = 0;
        serial_in_left = 0;
        serial_in_right = 0;

        // Apply reset
        #10 rst = 0;

        // Test left shift
        #10 shift_left = 1; serial_in_left = 1; // Shift in '1' to LSB
        #10 shift_left = 1; serial_in_left = 0; // Shift in '0' to LSB
        #10 shift_left = 1; serial_in_left = 1; // Shift in '1' to LSB
        #10 shift_left = 0;

        // Test right shift
        #10 shift_right = 1; serial_in_right = 1; // Shift in '1' to MSB
        #10 shift_right = 1; serial_in_right = 0; // Shift in '0' to MSB
        #10 shift_right = 1; serial_in_right = 1; // Shift in '1' to MSB
        #10 shift_right = 0;

        // Test reset
        #10 rst = 1; // Reset register
        #10 rst = 0;

        // End simulation
        #50 $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | rst=%b | shift_left=%b | shift_right=%b | serial_in_left=%b | serial_in_right=%b | q=%b", 
                 $time, rst, shift_left, shift_right, serial_in_left, serial_in_right, q);
    end

endmodule

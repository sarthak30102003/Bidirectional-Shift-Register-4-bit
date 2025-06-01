`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2024 16:58:44
// Design Name: 
// Module Name: bidirectional_shift_register
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


module bidirectional_shift_register (
    input clk,            // Clock signal
    input rst,            // Reset signal
    input shift_left,     // Shift left control
    input shift_right,    // Shift right control
    input serial_in_left, // Serial input for left shift
    input serial_in_right,// Serial input for right shift
    output [3:0] q        // 4-bit register output
);

    reg [3:0] register;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            register <= 4'b0000; // Reset register to 0
        end else if (shift_left) begin
            // Shift left: Load serial_in_left into the LSB
            register <= {register[2:0], serial_in_left};
        end else if (shift_right) begin
            // Shift right: Load serial_in_right into the MSB
            register <= {serial_in_right, register[3:1]};
        end
    end

    assign q = register; // Assign register to output

endmodule

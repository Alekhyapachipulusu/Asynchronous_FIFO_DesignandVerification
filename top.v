`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 11:48:06
// Design Name: 
// Module Name: top
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


module top(
input rclk,rreset,
input wclk,wreset,
input [31:0]data_in,
input read,
input write,
output [31:0]data_out,
output full,
output empty
);


wire [3:0]write_pointer_sync;
wire [3:0]read_pointer_sync;
wire [3:0]grey_write_pointer;
wire [3:0]grey_read_pointer;
wire [3:0]write_pointer;
wire [3:0]read_pointer;
    
a_fifo f1(wclk,rclk,read,write,read_pointer,write_pointer,full,empty,data_in,data_out);
 
synchronizer s1(wclk,wreset,grey_write_pointer,write_pointer_sync);
synchronizer s2(rclk,rreset,grey_read_pointer,read_pointer_sync);

read_handler r1(rclk,rreset,write_pointer_sync,read,read_pointer,grey_read_pointer,empty);
write_handler w1(
wclk,
wreset,
read_pointer_sync,
write,write_pointer,
grey_write_pointer,full
);   
    
endmodule

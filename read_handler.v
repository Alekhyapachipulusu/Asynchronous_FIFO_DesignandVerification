`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 11:25:40
// Design Name: 
// Module Name: read_handler
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


module read_handler(
input rclk,
input rreset,
input [3:0]write_pointer_sync,
input read,
output reg [3:0] read_pointer,
output [3:0]grey_read_pointer,
output empty
);





assign grey_read_pointer=read_pointer^(read_pointer>>1);


always@(posedge rclk or posedge rreset) begin
if(rreset) begin
read_pointer<=0;
end else if(read &&!empty) begin
read_pointer<=read_pointer+1;
end
end


assign empty=(grey_read_pointer==write_pointer_sync);





endmodule
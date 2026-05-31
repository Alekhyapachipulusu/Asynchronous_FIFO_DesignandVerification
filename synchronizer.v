`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 11:22:23
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
input clk,input reset,input [3:0]data_in,output reg [3:0]data_out
    );
    
reg [3:0]q1;

always@(posedge clk) begin
if(reset) begin
data_out<=4'b0;
q1<=4'b0;
end else begin
q1<=data_in;
data_out<=q1;
end    
end    
    
endmodule

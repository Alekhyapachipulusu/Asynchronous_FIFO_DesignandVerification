
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2026 19:50:54
// Design Name: 
// Module Name: a_fifo
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


module a_fifo(
input wclk,//write clk
input rclk,//read clk
input read,
input write,
input [3:0]read_pointer,
input [3:0]write_pointer,
input full,
input empty,
input [31:0]data_in,
output reg [31:0]data_out
    );
    reg [31:0]fifo[7:0];
    integer i;
    
    initial begin
    for(i=0;i<8;i=i+1) begin
    fifo[i]<=32'b0;
    end
    end
    
    
 
 
 always@(posedge wclk) begin
 if(write && !full) begin
 fifo[write_pointer]<=data_in;
 end 
 end
 
 always@(posedge rclk) begin
 if(read && !empty) begin
 data_out<=fifo[read_pointer];
 end
 end
 
 

         
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule

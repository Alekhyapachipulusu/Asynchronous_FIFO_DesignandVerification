module write_handler(
input wclk,
input wreset,
input [3:0]read_pointer_sync,
input write,
output reg [3:0]write_pointer,
output  [3:0]grey_write_pointer,
output  full
);

assign grey_write_pointer=write_pointer^(write_pointer>>1);


always@(posedge wclk or posedge wreset) begin
if(wreset) begin
write_pointer<=0;
end else if(write) begin
write_pointer<=write_pointer+1;
end
end


assign full=(grey_write_pointer=={~read_pointer_sync[3:2],read_pointer_sync[1:0]}); 




endmodule
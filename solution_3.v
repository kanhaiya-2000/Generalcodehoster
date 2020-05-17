`timescale 1ns/1ps
module turing(clk,result,done);
input wire clk;
output reg[32-1:0] result;
output reg     done;
integer i ;
`define SYM_A  2'b00
`define SYM_ADD  2'b01
`define SYM_BLANK  2'b10
reg currentIndex;
reg [18:0] mytape [1:0];
initial
begin
mytape[0] = `SYM_BLANK;
mytape[1] = `SYM_BLANK;
mytape[2] = `SYM_BLANK;
mytape[3] = `SYM_BLANK;
mytape[4] = `SYM_BLANK;
mytape[5] = `SYM_BLANK;
mytape[6] = `SYM_A;
mytape[7] = `SYM_A;
mytape[8] = `SYM_A;
mytape[9] = `SYM_ADD;
mytape[10] = `SYM_A;
mytape[11] = `SYM_A;
mytape[12] = `SYM_A;
mytape[13] = `SYM_A;
mytape[14] = `SYM_BLANK;
mytape[15] = `SYM_BLANK;
mytape[16] = `SYM_BLANK;
mytape[17] = `SYM_BLANK;
mytape[18] = `SYM_BLANK;
currentIndex = 0;
end
always@(posedge clk) begin
for(i = 0;i<19;i = i+1)begin
if(mytape[i]==`SYM_ADD) begin
mytape[i] = `SYM_A;
end
end
for(i = 18;i>=0;i = i-1)begin
if(mytape[currentIndex]==`SYM_A)begin
mytape[currentIndex] = `SYM_BLANK;
i = -1 ;
end
end
for(i = 0;i<33;i = i+1)begin
result[i] = mytape[i/2][i%2];
end
done = 1'bz;
end
endmodule
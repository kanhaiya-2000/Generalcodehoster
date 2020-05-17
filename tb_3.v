`timescale 1ns/1ps
module tb_3;
reg clock,res,done;
turing t(.clk(clock),.result(res),.done(done));
initial begin
clock = 1'b0;
done = 1'bx;
forever begin 
 clock = ~clock;
end
end
always @(done)begin
#3
if(res!=32'b10101010101010101000000000000000)
$display("Test case failed");
else 
$display("All Test cases succesfull passed");
end
endmodule
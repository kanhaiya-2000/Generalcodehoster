`timescale 1ns/1ps
module and4_lut_tb;
reg [3:0] wre;
reg res;
and4_lut a1(.address(wre),.result(res));
initial wre = 4'b0000;
reg error;
initial error = 0;
always begin 
  wre = wre + 4'b0001;
  #25
  if((res!=(wre[0]&wre[1]&wre[2]&wre[3]))||^res ===1'bx)begin
    error = error + 1;
    $display("Test failed for the address[0]:%b address[1]:%b address[2]:%b address[3]:%b\nExpected:%b\nGot:%b",wre[0],wre[1],wre[2],wre[3],(wre[0]&wre[1]&wre[2]&wre[3]),res);
  end
  if(wre== 4'b1111)begin
  $display("-------------------------------");
   if(error==0)
   $display("All test cleared succesfully");
   else
   $display("%d cases failed,see details above",error);
  end
  $finish;
  end
  endmodule
  module and2_lut_tb;
reg [1:0] wre;
reg res;
and2_lut a2(.address(wre),.result(res));
initial wre = 2'b00;
reg error;
initial error = 0;
always begin 
  wre = wre + 2'b01;
  #25
  if((res!=(wre[0]&wre[1]))||^res ===1'bx)begin
    error = error + 1;
    $display("Test failed for the address[0]:%b address[1]:%b \nExpected:%b\nGot:%b",wre[0],wre[1],(wre[0]&wre[1]),res);
  end
  if(wre== 2'b11)begin
  $display("-------------------------------");
   if(error==0)
   $display("All test cleared succesfully");
   else
   $display("%d cases failed,see details above",error);
  end
  $finish;
  end  
endmodule
 module equation_lut_tb;
reg a,b,c,d,res;
equation_lut a3(.a(a),.b(b),.c(c),.d(d),.result(res));
initial a = 1'b0;
initial b = 1'b0;
initial c = 1'b0;
initial d = 1'b0;
reg error,expected;
initial error = 0;
always begin 
  a = a+ 1'b1;
  #50
  b = b+1'b1;
  #100
  c = c+ 1'b1;
  #200
  d = d+1'b1;
  expected = (((a&b&c&d)|(c^a))~^d);
  #25
  if((res!=expected)||(^res ===1'bx))begin
    error = error + 1;
    $display("Test failed for the a:%b, b:%b,c:%b,d:%b \nExpected:%b\nGot:%b",a,b,c,d,expected,res);
  end
  if({a,b,c,d}== 4'b1111)begin
  $display("-------------------------------");
   if(error==0)
   $display("All test cleared successfully");
   else
   $display("%d cases failed,see details above",error);
  end  
  $finish;
  end  
endmodule
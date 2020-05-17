`timescale 1ns/1ps
module tb_2_1;
    reg [1:0] in;
    reg [1:0] select;
    wire result;
    multiplexer m1(.result(result),.in1(in[0]),.in2(in[1]),.select(select[0]));
    initial in = 2'b00 ;
    initial select = 2'b00;   
    reg error,res;
    initial error = 0;
    always begin
       select= select + 2'b01;
       in = in + 2'b01;
       res = select[0]?in[0]:in[1];
       #25
          if((result!= res)||(^result === 1'bx))begin
            $display("Test case failed for in1:%b ,in2:%b,select:%b,expected result:%b,actual result:%b",in[0],in[1],select[0],res,result);
            error = error+1;
          end
          if(in==2'b11)begin
          $display("-------------------------------");
          if(error==0)
           $display("Test completed succesfully!");
           else begin
             $display("Test failed for %d cases",error);
             end
             $finish;
         end           
    end
endmodule
// testbenches for multiplexer with no delay will be the same
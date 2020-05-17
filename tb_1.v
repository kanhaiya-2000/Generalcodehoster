`timescale 1ns/1ps
module tb_1_1;
    reg inp;
    wire result;
    example1 e1(.inp(inp),.result(result));
    initial inp = 1'b0;
    reg error;
    initial error = 0;
    always begin
        inp = inp +1'b1;
        #25
          if((result!= ~inp)||(^result=== 1'bx))begin
            error = error +1;
            $display("Testcase failed for input:%b,resultant output:%b,expected:%b",inp,result,~inp);
        end
        if(inp==1'b1) begin
            $display("-------------------------------");
            if(error==0)
                $display("All test passed!");
            else
                $display("Test case failed for some cases!Check details above");
                $finish;
         end
        end

endmodule
module tb_1_2;
    reg inp2;
    wire result2;
    generatenoninvertingbuffer e2(.inp2(inp2),.result2(result2));
    initial inp2 = 1'b0;
    reg error2;
    initial error2 = 0;
    always begin
        inp2 = inp2 +1'b1;
        #25
          if((result2!= ~(~inp2))||(^result2=== 1'bx))begin
            error2 = error2 +1;
            $display("Testcase failed for input:%b,resultant output:%b,expected:%b",inp2,result2,~(~inp2));
        end
        if(inp2==1'b1) begin
            $display("-------------------------------");
            if(error2==0)
                $display("All test passed!");
            else
                $display("Test case failed for some cases!Check details above");
                $finish;
         end
        end
endmodule
module tb_1_3;
    reg inp;
    wire result;
    ring5 e3(.inp(inp),.result(result));
    initial inp = 1'b0;
    reg error;
    initial error = 0;
    always begin
        inp = inp +1'b1;
        #25
          if((result!= ~inp)||(^result=== 1'bx))begin
            error = error +1;
            $display("Testcase failed for input:%b,resultant output:%b,expected:%b",inp,result,~inp);
        end
        if(inp==1'b1) begin
            $display("-------------------------------");
            if(error==0)
                $display("All test passed!");
            else
                $display("Test case failed for some cases!Check details above");
                $finish;
         end
        end

endmodule
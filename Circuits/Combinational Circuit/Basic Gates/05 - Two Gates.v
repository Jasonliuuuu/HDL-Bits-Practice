module top_module (
    input in1,
    input in2,
    input in3,
    output reg out);
    
    wire w1; 
    assign w1 = ~(in1 ^ in2);  //We can only use assign in this case since w1 is wire. We can't use in always block
    assign out = w1 ^ in3; 

endmodule

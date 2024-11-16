module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a ^ b ^ cin; 
    assign cout = (a & b) | (a & cin) | (b & cin); 

endmodule

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire w0, w1, w2; 
    
    full_adder f0(.a(x[0]), 
                  .b(y[0]), 
                  .cin(1'b0), 
                  .cout(w0), 
                  .sum(sum[0])
                 ); 
    
    full_adder f1(.a(x[1]), 
                  .b(y[1]), 
                  .cin(w0), 
                  .cout(w1), 
                  .sum(sum[1])
                 ); 
    
    full_adder f2(.a(x[2]), 
                  .b(y[2]), 
                  .cin(w1), 
                  .cout(w2), 
                  .sum(sum[2])
                 ); 
    full_adder f3(.a(x[3]), 
                  .b(y[3]), 
                  .cin(w2), 
                  .cout(sum[4]), 
                  .sum(sum[3])
                 ); 
    
    

endmodule

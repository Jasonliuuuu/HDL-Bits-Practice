module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire w1, w2; 
    wire [15:0] sum0, sum1; 
    
    add16 instance1(.a(a[15:0]), 
                    .b(b[15:0]), 
                    .cin(1'b 0), 
                    .sum(sum[15:0]), 
                    .cout(w1)
                   ); 
    add16 instance2(.a(a[31:16]), 
                    .b(b[31:16]), 
                    .cin(1'b 0), 
                    .sum(sum0), 
                    .cout(w2)
                   );
    add16 instance3(.a(a[31:16]), 
                    .b(b[31:16]), 
                    .cin(1'b 1), 
                    .sum(sum1), 
                    .cout(w2)
                   );
    
    always @(*) begin 
        case(w1)
            0: sum[31:16] = sum0; 
            1: sum[31:16] = sum1; 
        endcase
        
    end
    

endmodule

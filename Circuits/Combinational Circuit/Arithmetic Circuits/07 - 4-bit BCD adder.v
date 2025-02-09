module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire w1, w2, w3; 
    
    bcd_fadd m0(.a(a[3:0]), 
                .b(b[3:0]),
                .cin(cin), 
                .cout(w1), 
                .sum(sum[3:0])
               ); 
    bcd_fadd m1(.a(a[7:4]), 
                .b(b[7:4]),
                .cin(w1), 
                .cout(w2), 
                .sum(sum[7:4])
               ); 
    bcd_fadd m2(.a(a[11:8]), 
                .b(b[11:8]),
                .cin(w2), 
                .cout(w3), 
                .sum(sum[11:8])
               ); 
    bcd_fadd m3(.a(a[15:12]), 
                .b(b[15:12]),
                .cin(w3), 
                .cout(cout), 
                .sum(sum[15:12])
               ); 
    

endmodule

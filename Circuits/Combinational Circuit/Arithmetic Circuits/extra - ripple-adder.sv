module full_adder (
  input  logic a, b, cin,
  output logic sum, cout
);
  assign {cout, sum} = a + b + cin;
endmodule

module ripple_adder #(parameter N =8) (
  input  [N-1:0] a, b,
  input          cin,
  output [N-1:0] sum,
  output         cout
);

    logic [N-1:0] c; 
    assign c[0] = cin; 
    assign cout = c[N]; 

    genvar i; 
    
    generate
        for (i = 0; i<N; i++) begin : adder_stage
            full_adder fa(
                .a (a[i]), 
                .b (b[i]), 
                .cin (c[i]),
                .sum (sum[i]),
                .cout(c[i+1])
            ); 
        end
    endgenerate
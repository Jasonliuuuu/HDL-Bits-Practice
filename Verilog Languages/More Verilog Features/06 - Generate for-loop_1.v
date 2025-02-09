module one_bit_FA(
    input a, b, 
    input cin, 
    output cout, sum
); 
    assign sum = a ^ b ^ cin; 
    assign cout = (a & b) | (a & cin) | (b & cin); 
    
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar i; 
    
    one_bit_FA FA1(.a(a[0]), 
                   .b(b[0]), 
                   .cin(cin), 
                   .cout(cout[0]), 
                   .sum(sum[0])
                  ); 
    //The first full adder instance is manually instantiated before the generate block because the first bit's carry-in (cin) is an external input, not a carry-out from a previous bit.
    
    generate 
        for (i =1; i < 100; i = i + 1) begin: Full_adder_block
            one_bit_FA FA(a[i], b[i], cout[i-1], cout[i], sum[i]); 
        end
    endgenerate
    //When synthesized or simulated, each full adder will appear with a unique name like Full_adder_block[1].FA, Full_adder_block[2].FA, and so on. This makes debugging and waveform analysis easier because each instance is identifiable.
    
                       
    
    

endmodule

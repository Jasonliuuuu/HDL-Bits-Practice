module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] carry; 
    
    bcd_fadd first_bcd_fadd (
        .a(a[3:0]),
        .b(b[3:0]),       
        .cin(cin),         
        .sum(sum[3:0]),      
        .cout(carry[0])      
    );
    
    genvar i; 
    
    generate
        for(i = 1; i < 100; i = i + 1) begin : BCD_adder_block
            bcd_fadd bcd_fadd_instance(
                .a(a[i*4 +: 4]), //[7:4] -> [11:8]
                .b(b[i*4 +: 4]),
                .cin(carry[i - 1]), 
                .cout(carry[i]), 
                .sum(sum[i*4 +: 4])
            ); 
        end
    endgenerate
    
    // Final carry-out for the entire 100-digit BCD addition
    assign cout = carry[99];
    
endmodule

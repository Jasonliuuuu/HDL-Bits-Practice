module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    assign out = in[sel*4 +: 4];

    //in[0 +: 4] selects 4 bits starting from bit 0.
    //in[4 +: 4] selects 4 bits starting from bit 4.
    //in[8 +: 4] selects 4 bits starting from bit 8.


endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    
    wire w1, w2, w3, w4, w5, w6; 
    assign w1 = x ^ w4; 
    assign w2 = x & ~(w5); 
    assign w3 = x | ~(w6); 
    
    always @(posedge clk) begin
        w4 <= w1; 
        w5 <= w2;
        w6 <= w3;
    end
    
    assign z = ~(w4 | w5 | w6); 

endmodule

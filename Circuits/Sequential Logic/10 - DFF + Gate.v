module top_module (
    input clk,
    input in, 
    output out);
    
    wire w1; 
    
    assign w1 = out ^ in; 
    always @(posedge clk) begin
        out <= w1; 
    end
    

endmodule

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    wire d; 
    assign d = (j & ~Q) | (~k & Q); 
    
    always @(posedge clk) begin
        Q <= d; 
    end
    
    

endmodule


//this is one of the most difficicult question so far
//Remember to get the excitation table by usint the truth table
// then you will have three input and one output
// Three input: J, K , and the Q(t)
// One output: Q(t+1)
// Look at the Q(t+1), you will have two 1
// try to describe it with those input
// that's how you get assign d = (j & ~Q) | (~k & Q); 
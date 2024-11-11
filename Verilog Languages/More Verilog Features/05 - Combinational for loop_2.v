module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    integer i; 
    reg [7:0] counter; 
    
    always @(in) begin
        counter = 0; 
        for(i = 0 ; i<255; i++) begin 
            if (in[i] == 1)
                counter++; 
        end
        
        out = counter; 
        
    end

endmodule

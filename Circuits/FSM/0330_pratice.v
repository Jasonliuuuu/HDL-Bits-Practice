module sensor(
    input clk,
    input in,
    input reset, //sunchronous reset
    output pulse
); 

    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8; 
    reg [3:0] state, next_state; 

    always @(*) begin 
        case (state) begin
            S0: next_state = in? S0: S1; 
            S1: next_state = in? S0: S2; 
            S2: next_state = in? S0: S3; 
            S3: next_state = in? S0: S4;
            S4: next_state = in? S0: S5; 
            S5: next_state = in? S0: S6; 
            S6: next_state = in? S0: S7; 
            S7: next_state = in? S0: S8; 
            S8: next_state = S0; 
            default:
            next_state = state; 
        endcase
    end

    always @(posedge clk) begin 
        if (reset) 
            state <= S0; 
        else
            state <= next_state;
    end

    assign out = (state == S8); 

endmodule
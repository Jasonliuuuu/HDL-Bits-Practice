module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter LEFT = 0, RIGHT = 1, LEFT_aaah = 2, RIGHT_aaah = 3, LEFT_dig = 4, RIGHT_dig = 5; 
    reg [2:0] state, next_state; 

    always @(posedge clk, posedge areser) begin
        if (areset)
            state <= LEFT; 
        else
            state <= next_state; 
    end

    always @(*) begin
        case (state)
            LEFT: begin
                if (ground)
                    next_state <= bump_left? RIGHT: LEFT; 
                else
                    next_state <= 
    end






endmodule
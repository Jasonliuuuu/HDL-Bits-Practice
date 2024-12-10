module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT = 0, RIGHT = 1, LEFT_aaah = 2, RIGHT_aaah = 3; 
    reg [2:0] state, next_state; 
    
    always @(posedge clk, posedge areset) begin
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
                    next_state <= LEFT_aaah; 
            end
            RIGHT: begin
                if (ground)
                    next_state <= bump_right? LEFT: RIGHT; 
                else
                    next_state <= RIGHT_aaah; 
            end
            LEFT_aaah: begin
                if (ground)
                    next_state <= LEFT; 
                else
                    next_state <= LEFT_aaah; 
            end
            RIGHT_aaah: begin
                if (ground)
                    next_state <= RIGHT; 
                else
                    next_state <= RIGHT_aaah; 
            end
        endcase
    end
            
    assign walk_left = (state == LEFT); 
    assign walk_right = (state == RIGHT); 
    assign aaah = ((state == LEFT_aaah) || (state == RIGHT_aaah)); 
            
endmodule
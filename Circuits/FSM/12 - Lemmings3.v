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
    
    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= LEFT; 
        else
            state <= next_state; 
    end
    
    always @(*)
        case (state)
            LEFT: begin
                if (ground) begin
                    if (dig) begin
                        next_state <= LEFT_dig; 
                    end
                    else begin
                        next_state <= bump_left? RIGHT:LEFT; 
                    end
                end
                else begin
                    next_state <= LEFT_aaah; 
                end
            end
            RIGHT: begin
                if (ground) begin
                    if (dig) begin
                        next_state <= RIGHT_dig; 
                    end
                    else begin
                        next_state <= bump_right? LEFT: RIGHT; 
                    end
                end
                else begin
                    next_state <= RIGHT_aaah; 
                end
            end
            LEFT_aaah: begin
                if (ground) begin
                    next_state <= LEFT;
                end
                else begin
                    next_state <= LEFT_aaah;
                end
            end
            
            RIGHT_aaah: begin
                if (ground) begin
                    next_state <= RIGHT;
                end
                else begin
                    next_state <= RIGHT_aaah;
                end
            end
            LEFT_dig: begin
                if (ground) begin
                    next_state <= LEFT_dig;
                end
                else begin
                    next_state <= LEFT_aaah;
                end
            end
            RIGHT_dig: begin
                 if (ground) begin
                    next_state <= RIGHT_dig;
                end
                else begin
                    next_state <= RIGHT_aaah;
                end
            end

        endcase
    
    assign walk_left = (state == LEFT); 
    assign walk_right = (state == RIGHT); 
    assign aaah = ((state == LEFT_aaah) || (state == RIGHT_aaah)); 
    assign digging = ((state == LEFT_dig) || (state == RIGHT_dig)); 
    

endmodule

module A (input x, input y, output z);
    
    assign z = (x ^ y) & x; 

endmodule

module B ( input x, input y, output z );
    
    assign z = (~x & ~y) | (x & y); 

endmodule



module top_module (input x, input y, output z);
    wire w1, w2, w3, w4, w5, w6; 
    
    A IA1(.x(x), 
          .y(y), 
          .z(w1)
         ); 
    A IA2(.x(x), 
          .y(y), 
          .z(w3)
         ); 
    
    
    B IB1(.x(x), 
         .y(y), 
          .z(w2)
        ); 
    B IB2(.x(x), 
         .y(y), 
          .z(w4)
        ); 
    assign w5 = w1 | w2; 
    assign w6 = w3 & w4; 
    assign z = w5 ^ w6; 
    

endmodule

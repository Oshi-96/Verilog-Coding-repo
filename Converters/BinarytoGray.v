module testbed;
    reg [3:0]B;
    wire [3:0]G;

    BtoG bg(.G(G), .B(B));
    initial begin
        $monitor($time, " B = %b, G = %b", B, G);
        B = 4'b0101; #10
        B = 4'b0000; #10
        $finish;
    end
endmodule

module BtoG #(parameter N = 4)(
    input [N-1:0] B,
    output [N-1:0] G);
    
    genvar i ;
    generate
        for(i = 0; i < N-1 ; i = i+1)
        begin
            assign G[i] = B[i] ^ B[i+1];
        end
    endgenerate
    assign G[N-1] = B[N-1];
endmodule
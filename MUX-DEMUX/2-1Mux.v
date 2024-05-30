module testbed;
    reg [1:0]In;
    reg S;
    wire out;

    mux2 m2(.I(In), .S(S), .out(out));
    initial begin
        In = 2'b01;
        $monitor($time, " S = %b, out = %b", S, out);
        S = 0; #10
        S = 1; #10
        $finish;
    end

endmodule


module mux2(
    input [1:0]I,
    input S,
    output reg out);

always @(*)
    case(S)
        0: out = I[0];
        1: out = I[1];
        default : out = 1'bx;
    endcase
endmodule
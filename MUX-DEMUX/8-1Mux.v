module testbed;
    reg [7:0]I;
    wire out;
    reg [2:0]S;

    mux8 m8(out, I, S);
    initial begin
        I = 8'b11100010;
        $monitor($time, " S = %d, out = %b ", S, out);
        S = 0 ; #10
        S = 2 ; #10
        S = 4 ; #10
        S = 7 ; #10
        $finish;
    end
endmodule


module mux8(
    output reg out,
    input [7:0]I,
    input [2:0]S
    );

    always @(*)
    case(S)
        0 : out = I[0];
        1 : out = I[1];
        2 : out = I[2];
        3 : out = I[3];
        4 : out = I[4];
        5 : out = I[5];
        6 : out = I[6];
        7 : out = I[7];
        default : out = 1'bx;
    endcase
endmodule
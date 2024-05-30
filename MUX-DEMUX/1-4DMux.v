module testbed;
    reg [1:0]S;
    reg I;
    wire [3:0] out;

    Dmux4 dm4(.out(out), .I(I), .S(S));

    initial begin
        I = 1'b1;
        $monitor($time, " S = %d, out = %b", S, out);
        S = 0; #10
        S = 1; #10
        S = 2; #10
        S = 3; #10
        $finish;
    end
endmodule


module Dmux4(
    output reg [3:0]out,
    input I,
    input [1:0]S
);

    always @(*)
    begin
        out = 4'b0000;
    case(S)
        2'b00: out[0] = I;
        2'b01: out[1] = I;
        2'b10: out[2] = I;
        2'b11: out[3] = I;
        default: out = 4'bxxxx;
    endcase
    end
endmodule
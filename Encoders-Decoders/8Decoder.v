module testbed;
    reg [2:0] in;
    wire [7:0] out;

    Decoder8 d1(out, in);
    initial 
    begin
        $monitor($time, " in = %d, out = %b", in, out);
        in = 0 ; #10
        in = 1 ; #10
        in = 2 ; #10
        in = 7 ; #10
        $finish;
    end
endmodule


module Decoder8(out, in);
    input [2:0] in;
    output reg [7:0] out ;

    always @(*)
    begin
        case(in)
            0 : out = 8'd1;
            1 : out = 8'd2;
            2 : out = 8'd4;
            3 : out = 8'd8;
            4 : out = 8'd16;
            5 : out = 8'd32;
            6 : out = 8'd64;
            7 : out = 8'd128;
            default : out = 8'dx;
        endcase
    end
endmodule
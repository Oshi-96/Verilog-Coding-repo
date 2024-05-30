module testbed;
    reg [3:0] In;
    wire [1:0] out;

    Encoder4 e4(out, In);
    initial
    begin
        $monitor($time, " In = %b , out = %b ", In, out);
        In = 4'b0001 ; #10
        In = 4'b0010 ; #10
        In = 4'b0100 ; #10
        In = 4'b1000 ; #10
        $finish;
    end
endmodule


module Encoder4(out, In);
    input [3:0] In;
    output reg [1:0] out;

    always @(*)
    begin
        case(In)
            1: out = 0;
            2: out = 1;
            4: out = 2;
            8: out = 3;
            default : out = 2'bxx;
        endcase
    end
endmodule
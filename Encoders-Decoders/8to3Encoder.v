module testbed;
    reg [7:0] In;
    wire [2:0] y;

    Encoder8to3 e8(.y(y), .In(In));

    initial 
    begin
        $monitor($time, " In = %b, out = %b", In, y);
        In = 8'b00000001; #10
        In = 8'b00000010; #10
        In = 8'b00000100; #10
        In = 8'b00001000; #10
        In = 8'b00010000; #10
        $finish;
    end
endmodule


module Encoder8to3(
    input [7:0] In,
    output reg [2:0] y
    );

    always @(*)
    begin
    case(In)
        8'b00000001: y = 3'd0;
        8'b00000010: y = 3'd1;
        8'b00000100: y = 3'd2;
        8'b00001000: y = 3'd3;
        8'b00010000: y = 3'd4;
        8'b00100000: y = 3'd5;
        8'b01000000: y = 3'd6;
        8'b10000000: y = 3'd7;
        default: y = 3'b000;
    endcase
    end
endmodule
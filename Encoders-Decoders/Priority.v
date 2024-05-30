module testbed;
    reg [7:0] In;
    wire [2:0] out;

    PEnc8 pe8(.out(out), .In(In));

    initial 
    begin
        $monitor($time, " In = %b, out = %b", In, out);
        In = 8'b00000001; #10
        In = 8'b00000010; #10
        In = 8'b00000110; #10
        In = 8'b00011000; #10
        In = 8'b10010000; #10
        $finish;
    end
endmodule


module PEnc8(out, In);
    input [7:0] In;
    output reg [2:0] out;

    always @(*)
    begin
        out = 3'b000;
        casex(In)
            8'b1xxxxxxx : out = 3'd7;
            8'bx1xxxxxx : out = 3'd6;
            8'bxx1xxxxx : out = 3'd5;
            8'bxxx1xxxx : out = 3'd4;
            8'bxxxx1xxx : out = 3'd3;
            8'bxxxxx1xx : out = 3'd2;
            8'bxxxxxx1x : out = 3'd1;
            8'bxxxxxxx1 : out = 3'd0;
            default : out = 3'bxxx;
        endcase
    end

endmodule
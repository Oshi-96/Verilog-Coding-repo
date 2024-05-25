module testbed;
    reg in1, in2 ;
    wire [2:0] out ;

    Comp1 c1(out, in1, in2);
    initial begin
        $monitor($time, " in1 = %b, in2 = %b, out = %b", in1, in2, out);
        in1 = 0 ; in2 = 1 ; #10
        in1 = 1 ; in2 = 0 ; #10
        in1 = 1 ; in2 = 1 ; #10
        in1 = 0 ; in2 = 0 ; #10
        $finish;
    end
endmodule

module Comp1(out, in1, in2);
    input in1, in2;
    output reg [2:0] out;

    always @(*)
    begin
        if(in1 < in2)
            out <= 3'b100;
        else begin
        if (in1 == in2)
            out <= 3'b010;
        else
            out <= 3'b001;
        end
    end
endmodule
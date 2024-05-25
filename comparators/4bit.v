module testbed;
    reg [3:0] in1, in2;
    wire lower, equal, greater;

    Comp4 c4(lower, equal, greater, in1, in2);
    initial
    begin
        $monitor ($time, "in1 = %b, in2 = %b,lower = %b, equal = %b, greater = %b", in1, in2, lower, equal, greater);
        in1 = 4'd5 ; in2 = 4'd1; #10
        $finish;
    end
endmodule

module Comp4(lower, equal, greater, in1, in2);
    input [3:0] in1, in2;
    output reg lower, equal, greater;

    always @(in1 or in2)
    
    begin
    lower = 0;
    equal = 0;
    greater = 0;

    if (in1 < in2)
        lower = 1;
    else if (in1 == in2)
        equal = 1;
    else if (in1 > in2)
        greater = 1;
    end
endmodule